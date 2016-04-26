#!/bin/sh

sh drivers/load_terasic_qsys_pcie_driver.sh

chmod +x app.c
make clean app.c & ./app
