#! /usr/bin/bash
rm Virt-Resources -rf
git clone https://github.com/tclark/op-papers/
mv op-papers/virtualisation ./
mv ./virtualisation Virt-Resources
rm op-papers -rf
