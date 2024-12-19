from enum import Enum
from fastapi import FastAPI, Body
from pydantic import BaseModel
from fastapi import status, HTTPException
import uvicorn

from random import randint


app = FastAPI()


class DogType(str, Enum):
    terrier = "terrier"
    bulldog = "bulldog"
    dalmatian = "dalmatian"


class Dog(BaseModel):
    name: str
    pk: int
    kind: DogType


class Timestamp(BaseModel):
    id: int
    timestamp: int


dogs_db = {
    0: Dog(name='Bob', pk=0, kind='terrier'),
    1: Dog(name='Marli', pk=1, kind="bulldog"),
    2: Dog(name='Snoopy', pk=2, kind='dalmatian'),
    3: Dog(name='Rex', pk=3, kind='dalmatian'),
    4: Dog(name='Pongo', pk=4, kind='dalmatian'),
    5: Dog(name='Tillman', pk=5, kind='bulldog'),
    6: Dog(name='Uga', pk=6, kind='bulldog')
}

post_db = [
    Timestamp(id=0, timestamp=12),
    Timestamp(id=1, timestamp=10)
]


@app.get('/', status_code=status.HTTP_200_OK)
def root():
    return {}

@app.post('/post', status_code=status.HTTP_200_OK)
def post() -> Timestamp:
    _post = Timestamp(id=post_db[-1].id+1, timestamp=randint(1, 30))
    post_db.append(_post)
    return _post

@app.get('/dog', status_code=status.HTTP_200_OK)
def get_dogs(kind: DogType = None) -> list[Dog]:
    return [dog for _, dog in dogs_db.items() if dog.kind == kind or kind is None]

@app.post('/dog', status_code=status.HTTP_200_OK)
def create_dog(dog: Dog) -> Dog:
    if dog.pk in dogs_db.keys():
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail=f"Dog with pk {dog.pk} already exists")
    _dog = Dog(
        name=dog.name,
        pk=dog.pk,
        kind=dog.kind
    )
    dogs_db.update({dog.pk: _dog})
    return _dog

@app.get('/dog/{pk}', status_code=status.HTTP_200_OK)
def get_dog_by_pk(pk: int) -> Dog:
    if pk not in dogs_db.keys():
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Dog with pk {pk} not found")
    return dogs_db[pk]

@app.patch('/dog/{pk}', status_code=status.HTTP_200_OK)
def update_dog(pk: int, updated_dog: Dog = Body()) -> Dog:
    if pk not in dogs_db.keys():
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Dog with pk {pk} not found")
    if pk != updated_dog.pk and updated_dog.pk in dogs_db.keys():
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail=f"New pk {updated_dog.pk} of the dog is already used")
    _ = dogs_db.pop(pk)
    dogs_db.update({updated_dog.pk: updated_dog})
    return updated_dog

