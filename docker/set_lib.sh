#!/bin/bash

BUILD_DIR="../build/lib.linux-x86_64-3.6/mmdet3d/ops"
STORE_DIR="../mmdet3d/ops"

cp "${BUILD_DIR}/ball_query/ball_query_ext.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/ball_query/"
cp "${BUILD_DIR}/furthest_point_sample/furthest_point_sample_ext.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/furthest_point_sample/"
cp "${BUILD_DIR}/gather_points/gather_points_ext.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/gather_points/"
cp "${BUILD_DIR}/group_points/group_points_ext.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/group_points/"
cp "${BUILD_DIR}/interpolate/interpolate_ext.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/interpolate/"
cp "${BUILD_DIR}/iou3d/iou3d_cuda.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/iou3d/"
cp "${BUILD_DIR}/roiaware_pool3d/roiaware_pool3d_ext.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/roiaware_pool3d/"
cp "${BUILD_DIR}/spconv/sparse_conv_ext.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/spconv/"
cp "${BUILD_DIR}/utils/compiling_info.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/utils/"
cp "${BUILD_DIR}/voxel/voxel_layer.cpython-36m-x86_64-linux-gnu.so" "${STORE_DIR}/voxel/"
echo "Done."