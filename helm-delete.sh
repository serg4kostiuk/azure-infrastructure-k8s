#!/bin/bash

helm list
helm delete $(helm list)
helm list