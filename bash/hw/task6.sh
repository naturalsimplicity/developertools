#!/usr/bin/env bash
(cat input.txt | wc -l) 2> error.log 1> output.txt
