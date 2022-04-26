'''
#wget http://plenodb.jpeg.org/pc/8ilabs/longdress.zip
unzip longdress.zip
rm *.pdf
rm *.docx
cd longdress
rm -R Png
rm Counts.txt
rm longdress_vox10.mp4
cd ../
rm *.pdf
rm *.docx

#wget http://plenodb.jpeg.org/pc/8ilabs/redandblack.zip
unzip redandblack.zip
cd redandblack
rm -R Png
rm Counts.txt
rm redandblack_vox10.mp4
cd ../
rm *.pdf
rm *.docx

#wget http://plenodb.jpeg.org/pc/8ilabs/soldier.zip
unzip soldier.zip
cd soldier
rm -R Png
rm Counts.txt
rm soldier_vox10.mp4
cd ../
rm *.pdf
rm *.docx

'''
function create_subset() {
    echo $1
    mkdir $1_$2
    cd $1/Ply
    for eachfile in *.ply
    do 
        open -a CloudCompare.app --args -SILENT -O /Users/kevinyao/Documents/Volumetric_Video/ply-draco-docker/data/$1/Ply/$eachfile -SS RANDOM $2 -C_EXPORT_FMT PLY -PLY_EXPORT_FMT ASCII -AUTO_SAVE ON -NO_TIMESTAMP -SAVE_CLOUDS -CLEAR ;
        echo "finish" /Users/kevinyao/Documents/Volumetric_Video/ply-draco-docker/data/$1/Ply/$eachfile
        sleep 2
    done
    rm *.bin
    mv *SUBSAMPLED* ../../$1_$2
    cd ../../$1_$2
    for file in *; do mv "${file}" "${file/_SUBSAMPLED/}"; done
    cd ../
}

if [ ! -d "longdress_10000" ]
then
    create_subset longdress 10000
fi

if [ ! -d "longdress_25000" ]
then
    create_subset longdress 25000
fi

if [ ! -d "longdress_50000" ]
then
    create_subset longdress 50000
fi

if [ ! -d "redandblack_10000" ]
then
    create_subset redandblack 10000
fi

if [ ! -d "redandblack_25000" ]
then
    create_subset redandblack 25000
fi

if [ ! -d "redandblack_50000" ]
then
    create_subset redandblack 50000
fi

if [ ! -d "soldier_10000" ]
then
    create_subset soldier 10000
fi

if [ ! -d "soldier_25000" ]
then
    create_subset soldier 25000
fi

if [ ! -d "soldier_50000" ]
then
    create_subset soldier 50000
fi