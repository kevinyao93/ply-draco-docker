wget http://plenodb.jpeg.org/pc/8ilabs/longdress.zip
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
cd ./longdress/Ply
mv *.ply* ../
cd ../
rmdir Ply
cd ../

wget http://plenodb.jpeg.org/pc/8ilabs/redandblack.zip
unzip redandblack.zip
cd redandblack
rm -R Png
rm Counts.txt
rm redandblack_vox10.mp4
cd ../
rm *.pdf
rm *.docx
cd ./redandblack/Ply
mv *.ply* ../
cd ../
rmdir Ply
cd ../

wget http://plenodb.jpeg.org/pc/8ilabs/soldier.zip
unzip soldier.zip
cd soldier
rm -R Png
rm Counts.txt
rm soldier_vox10.mp4
cd ../
rm *.pdf
rm *.docx
cd ./soldier/Ply
mv *.ply* ../
cd ../
rmdir Ply
cd ../

bash create_subsets.sh

rm longdress.zip
rm redandblack.zip
rm soldier.zip