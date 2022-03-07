import time
import pydraco
import os
import subprocess
import sys

sys.path.insert(0, '../../plySampler')
import drc_to_ply
import encode_buffer

#testdata_directory = "./longdress_vox10/"
testdata_directory="./subsampled/"
output_directory = "./drc_files/"

print(pydraco.add(1, 2))

def encode_decode_ply_file():
    file_l = []
    start = time.time()
    for i in range(1053, 1154):
        file_l.append(bytes(encode_buffer.encode_ply(file_path=testdata_directory + str(i)+'_SUBSAMPLED.ply').buffer))
    file_load_time = time.time()
    print("Time to load and encode files: ", (file_load_time - start))

    for file_num in range(len(file_l)):
        drc_to_ply.drc_buffer_to_ply(file_l[file_num], output_path=output_directory + str(file_num) + '.ply')
    file_output_time = time.time()
    print("Time to decode and output files: ", file_load_time - file_output_time)
    #file_path = os.path.abspath(os.path.join(testdata_directory, "longdress_ascii.ply"))
    #point_cloud_object = pydraco.ply_file_to_point_cloud_object(file_path) 
    '''
    with open(os.path.join(testdata_directory, "out.drc"), "rb") as ply_file:
        file_content = ply_file.read()
        print("start decoding")
        point_cloud_object = pydraco.decode_buffer_to_point_cloud(file_content, len(file_content))
        print(point_cloud_object)
        quantization_bits = 11
        compression_level = 7
        quantization_range = 8
        rgba_len = 3
        normal_len = 0
        quant_origin = 0
        create_metadata = False
        encoding_test = pydraco.encode_point_cloud(point_cloud_object.points, point_cloud_object.rgba, point_cloud_object.normal, rgba_len, normal_len, quantization_bits, compression_level, quantization_range, quant_origin, create_metadata)
        print("buffer len", len(bytes(encoding_test.buffer)))
        with open(os.path.join(testdata_directory, "output.drc"), "wb") as test_file:
            test_file.write(bytes(encoding_test.buffer))
        with open(os.path.join(testdata_directory, "output.drc"), "rb") as test_file:
            proc = subprocess.Popen(["../draco/build_dir/draco_decoder", "-i", "../testdata_files/output.drc", "-o", "../testdata_files/output_testing.ply"])
            proc.wait()
    
    
    with open(os.path.join(testdata_directory, "output.drc"), "rb") as test_file:
        file_content = test_file.read()
        print(len(file_content))
        # point_cloud_object = pydraco.decode_buffer_to_point_cloud(file_content, len(file_content))
        drc_to_ply.drc_buffer_to_ply(file_content, output_path = testdata_directory + 'output_buffer_to_ply.ply')
        # assert (point_cloud_object.encoding_options_set) is None
    '''


encode_decode_ply_file()
