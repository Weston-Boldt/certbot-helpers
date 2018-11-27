#!/bin/bash

# for when you are very stuck
search_stackoverflow() {
    search=""
    for term in $@; do
        search="$search%20$term"
    done
    lynx "https://stackoverflow.com/search?q=$search"
}
