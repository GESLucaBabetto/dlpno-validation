#!/bin/bash

filename=$1
fileroot=${filename::-4}

 
# B3LYP/cc-pVDZ Optimization
echo "B3LYP/cc-pVDZ Optimization"

function generate_input {
cat << EOF
# $fileroot OPT with B3LYP/cc-pVDZ

! B3LYP cc-pVDZ TightSCF Opt PAL4

* xyzfile 0 1 $filename

EOF

}

inout_root=${fileroot}_B3LYP_cc-pVDZ_OPT
old_root=$inout_root

generate_input > ${inout_root}.inp

/bin/orca_4_2_1_linux_x86-64_openmpi314/orca ${inout_root}.inp > ${inout_root}.out


# B3LYP/cc-pVTZ Optimization
echo "B3LYP/cc-pVTZ Optimization"

function generate_input {
cat << EOF
# $fileroot OPT with B3LYP/cc-pVTZ

! B3LYP cc-pVTZ TightSCF Opt PAL4

* xyzfile 0 1 ${old_root}.xyz

EOF

}

inout_root=${fileroot}_B3LYP_cc-pVTZ_OPT

generate_input > ${inout_root}.inp
old_root=$inout_root

/bin/orca_4_2_1_linux_x86-64_openmpi314/orca ${inout_root}.inp > ${inout_root}.out

# MP2/aug-cc-pVTZ Optimization
echo "MP2/aug-cc-pVTZ Optimization"

function generate_input {
cat << EOF
# $fileroot MP2/aug-cc-pVTZ Optimization

! MP2 aug-cc-pVTZ TightSCF Opt PAL4

* xyzfile 0 1 ${old_root}.xyz

EOF

}

inout_root=${fileroot}_MP2_aug-cc-pVTZ_OPT


generate_input > ${inout_root}.inp
old_root=$inout_root

/bin/orca_4_2_1_linux_x86-64_openmpi314/orca ${inout_root}.inp > ${inout_root}.out

# CCSD/aug-cc-pVTZ SPE
echo "CCSD/aug-cc-pVTZ SPE"

function generate_input {
cat << EOF
# $fileroot CCSD/aug-cc-pVTZ SPE

! CCSD aug-cc-pVTZ TightSCF PAL4

* xyzfile 0 1 ${old_root}.xyz

EOF

}

inout_root=${fileroot}_CCSD_aug-cc-pVTZ_SPE

generate_input > ${inout_root}.inp

/bin/orca_4_2_1_linux_x86-64_openmpi314/orca ${inout_root}.inp > ${inout_root}.out

# CCSD(T)/aug-cc-pVTZ SPE
echo "CCSD(T)/aug-cc-pVTZ SPE"

function generate_input {
cat << EOF
# $fileroot CCSD(T)/aug-cc-pVTZ SPE

! CCSD(T) aug-cc-pVTZ TightSCF PAL4

* xyzfile 0 1 ${old_root}.xyz

EOF

}

inout_root=${fileroot}_CCSDT_aug-cc-pVTZ_SPE

generate_input > ${inout_root}.inp

/bin/orca_4_2_1_linux_x86-64_openmpi314/orca ${inout_root}.inp > ${inout_root}.out

# DLPNO-CCSD/aug-cc-pVTZ SPE
echo "DLPNO-CCSD/aug-cc-pVTZ SPE"

function generate_input {
cat << EOF
# $fileroot DLPNO-CCSD/aug-cc-pVTZ SPE

! DLPNO-CCSD aug-cc-pVTZ aug-cc-pVTZ/C TightSCF PAL4

* xyzfile 0 1 ${old_root}.xyz

EOF

}

inout_root=${fileroot}_DLPNO-CCSD_aug-cc-pVTZ_SPE

generate_input > ${inout_root}.inp

/bin/orca_4_2_1_linux_x86-64_openmpi314/orca ${inout_root}.inp > ${inout_root}.out

# DLPNO-CCSD(T)/aug-cc-pVTZ SPE
echo "DLPNO-CCSD(T)/aug-cc-pVTZ SPE"

function generate_input {
cat << EOF
# $fileroot DLPNO-CCSD(T)/aug-cc-pVTZ SPE

! DLPNO-CCSD(T) aug-cc-pVTZ aug-cc-pVTZ/C TightSCF PAL4

* xyzfile 0 1 ${old_root}.xyz

EOF

}

inout_root=${fileroot}_DLPNO-CCSDT_aug-cc-pVTZ_SPE

generate_input > ${inout_root}.inp

/bin/orca_4_2_1_linux_x86-64_openmpi314/orca ${inout_root}.inp > ${inout_root}.out

exit
