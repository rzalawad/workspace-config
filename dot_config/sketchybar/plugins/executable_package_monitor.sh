#!/usr/bin/env bash

update() {


  brew update &> /dev/null

  # runs the outdated command and stores the output as a list variable.
  brewLIST=$(brew outdated)

  # checks to see if the returned list is empty. If so, it sets the outdated packages list to zero, if not, sets it to the line count of the list.
  if [[ $brewLIST == "" ]]; then
    BREW='0'
    brewLIST=""
  else
    BREW=$(echo "$brewLIST" | wc -l | sed 's/ //g')
  fi

  DEFAULT="0"

  # icon to be displayed if no packages are outdated. Change to `ZERO=""` if you want the widget to be invisible when no packages are out of date. Default: ✔︎
  ZERO="0"

  if [[ ${BREW:-DEFAULT} -gt 0 ]]; then
    FINAL="$BREW"
  else
    FINAL="$ZERO"
  fi

  sketchybar -m --set packages.total label="$FINAL" 
}

update
