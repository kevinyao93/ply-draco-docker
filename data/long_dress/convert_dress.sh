for eachfile in *.ply
do
    #open -a CloudCompare.app --args -O /Users/kevinyao/Documents/Volumetric_Video/long_dress/longdress_vox10_1053.ply -C_EXPORT_FMT PLY -PLY_EXPORT_FMT BINARY_LE -AUTO_SAVE ON -NO_TIMESTAMP -SAVE_CLOUDS -CLEAR
    #open -a CloudCompare.app --args  -O /Users/kevinyao/Documents/Volumetric_Video/long_dress/longdress_vox10_1053.ply -SS RANDOM 50000 -C_EXPORT_FMT PLY -PLY_EXPORT_FMT ASCII -AUTO_SAVE ON -NO_TIMESTAMP -SAVE_CLOUDS -CLEAR 
    open -a CloudCompare.app --args -SILENT -O /Users/kevinyao/Documents/Volumetric_Video/long_dress/$eachfile -SS RANDOM 50000 -C_EXPORT_FMT PLY -PLY_EXPORT_FMT ASCII -AUTO_SAVE ON -NO_TIMESTAMP -SAVE_CLOUDS -CLEAR ;
    sleep 2
    echo "finish" $eachfile
done

rm *.bin
mkdir subsampled_50000
mv *SUBSAMPLED* subsampled_50000

cd subsampled_50000
for file in *; do mv "${file}" "${file/_SUBSAMPLED/}"; done