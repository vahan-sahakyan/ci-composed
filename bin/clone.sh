#!/bin/bash

if [[ ! -d "frontend" ]]; then mkdir frontend; fi
if [[ ! -d "backend" ]]; then mkdir backend; fi

if [[ -z $(ls frontend) ]]; then
  git clone https://github.com/vahan-sahakyan/code-inspect-frontend.git frontend
fi

if [[ -z $(ls backend) ]]; then
  git clone https://github.com/vahan-sahakyan/code-inspect-backend.git backend
fi
