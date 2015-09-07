#!/bin/bash
home1="/home/old-ufo/mods/wxbs-journal/build/configs"
matcher="${home1}/./mods"
dataset="/windows/datasets/EF"
logs="/windows/mods/BMVC-2015/det_test/EF"

#dets=("FOCI" "DoGAff" "MSER" "HessAff" "DoG" "FOCI" "AdaptHessAff" "AdaptDoG" "AdaptMSER" "iiDoG" "SURF" "SURFAff" "ORB" "KAZE"  )
#dets=("DoGAff" "MSER" "HessAff" "DoG" "FOCI" "AdaptHessAff" "AdaptDoG" "AdaptMSER" )
#dets=("FOCIAff" "iiDoG" "SURF" "SURFAff" "ORB" "KAZE" "KAZEAff")
#dets=("WXBS" "SFOP" "WADE" "WASH")
dets=("WXBS-plain")
dets=("TILDE" "TILDE-scalespace")
dets=("TILDE-Cha" "TILDE-Cou" "TILDE-Fra" "TILDE-Mex" "TILDE-Pan")


for (( dd=0; dd<5; dd++)); do
det=${dets[${dd}]}
  logdir=${logs}/${det}
  echo $det
  config_file=config_iter_${det}.ini
    if [ "$det" = "WXBS-plain" ]; then
    config_file=config_iter_match_AdHes.ini
  fi
      if [ "$det" = "AdHesAfR" ]; then
    config_file=config_iter_match_adapt.ini
  fi
  if [ "$det" = "AdHes" ]; then
    config_file=config_iter_match_AdHes.ini
  fi
  if [ "$det" = "DoGAff" ]; then
    config_file=config_iter_match_fixed_DogAff.ini
  fi
  if [ "$det" = "AdaptHessAff" ]; then
    config_file=config_iter_match_adapt.ini
  fi
  if [ "$det" = "AdaptDoG" ]; then
    config_file=config_iter_match_adapt.ini
  fi
  if [ "$det" = "AdaptMSER" ]; then
    config_file=config_iter_match_adapt.ini
  fi
  if [ "$det" = "FOCIAff" ]; then
    config_file=config_iter_match_aff.ini
  fi
  if [ "$det" = "SURFAff" ]; then
    config_file=config_iter_match_aff.ini
  fi
  if [ "$det" = "KAZEAff" ]; then
    config_file=config_iter_match_aff.ini
  fi
  if [ "$det" = "iiDoG" ]; then
    config_file=config_iter_match_iiDoG.ini
  fi
  if [ "$det" = "Hes" ]; then
    config_file=config_iter_match_Hes.ini
  fi
  if [ "$det" = "WXBS" ]; then
    config_file=config_iter_match_adapt.ini
  fi  
    
  
  if [ ! -d ${logdir} ];
  then
      mkdir ${logdir}
      mkdir ${logdir}/img
  fi
    
    
  for file1 in ${dataset}/*
  do
    if [ -d $file1 ];
    then
      filename=$(basename "$file1")
      d=${filename}
      files=(${dataset}/${d}/*)
      f1=img1.png
      if [ "$d" = "Obama" ]; then
      for num in {6..13}
      do
	nnn=$(( num-4 ))
	f2=$(basename "img${nnn}.png")
	echo ${d}
	${matcher} ${dataset}/${d}/${f1} ${dataset}/${d}/${f2} ${logdir}/img/${d}-1-${nnn%.*}1.png ${logdir}/img/${d}-1-${nnn%.*}2.png\
        1.txt 2.txt m.txt ${logdir}/${d}-${nnn}.log 0 0 1.txt ${home1}/${config_file} $home1/iters_${det}.ini
      done
      fi
      if [ "$d" = "NotreDame" ]; then
      for num in {6..10}
      do
	nnn=$(( num-4 ))
	f2=$(basename "img${nnn}.png")
	echo ${d}
	${matcher} ${dataset}/${d}/${f1} ${dataset}/${d}/${f2} ${logdir}/img/${d}-1-${nnn%.*}1.png ${logdir}/img/${d}-1-${nnn%.*}2.png\
        1.txt 2.txt m.txt ${logdir}/${d}-${nnn}.log 0 0 1.txt ${home1}/${config_file} $home1/iters_${det}.ini
      done
      fi
      
      if [ "$d" = "Rushmore" ]; then
      for num in {6..10}
      do
	nnn=$(( num-4 ))
	f2=$(basename "img${nnn}.png")
	echo ${d}
	${matcher} ${dataset}/${d}/${f1} ${dataset}/${d}/${f2} ${logdir}/img/${d}-1-${nnn%.*}1.png ${logdir}/img/${d}-1-${nnn%.*}2.png\
        1.txt 2.txt m.txt ${logdir}/${d}-${nnn}.log 0 0 1.txt ${home1}/${config_file} $home1/iters_${det}.ini
      done
      fi
      
      if [ "$d" = "Yosemite" ]; then
      for num in {6..13}
      do
	nnn=$(( num-4 ))
	f2=$(basename "img${nnn}.png")
	echo ${d}
	${matcher} ${dataset}/${d}/${f1} ${dataset}/${d}/${f2} ${logdir}/img/${d}-1-${nnn%.*}1.png ${logdir}/img/${d}-1-${nnn%.*}2.png\
        1.txt 2.txt m.txt ${logdir}/${d}-${nnn}.log 0 0 1.txt ${home1}/${config_file} $home1/iters_${det}.ini
      done
      fi        
      
      if [ "$d" = "PaintedLadies" ]; then
      for num in {6..12}
      do
	nnn=$(( num-4 ))
	f2=$(basename "img${nnn}.png")
	echo ${d}
	${matcher} ${dataset}/${d}/${f1} ${dataset}/${d}/${f2} ${logdir}/img/${d}-1-${nnn%.*}1.png ${logdir}/img/${d}-1-${nnn%.*}2.png\
        1.txt 2.txt m.txt ${logdir}/${d}-${nnn}.log 0 0 1.txt ${home1}/${config_file} $home1/iters_${det}.ini
      done
      fi      
    fi
  done
done
