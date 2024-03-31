## *********************************************************
##
## File autogenerated for the pcl_ros package
## by the dynamic_reconfigure package.
## Please do not edit.
##
## ********************************************************/

from dynamic_reconfigure.encoding import extract_params

inf = float('inf')

config_description = {'name': 'Default', 'type': '', 'state': True, 'cstate': 'true', 'id': 0, 'parent': 0, 'parameters': [{'name': 'spatial_locator', 'type': 'int', 'default': 0, 'level': 0, 'description': 'Set the spatial locator', 'min': 0, 'max': 2, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': "{'enum': [{'name': 'ANN', 'type': 'int', 'value': 0, 'srcline': 9, 'srcfile': '/workspace/catkin_ws/src/perception_pcl/pcl_ros/cfg/MLS.cfg', 'description': 'ANN', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'FLANN', 'type': 'int', 'value': 1, 'srcline': 9, 'srcfile': '/workspace/catkin_ws/src/perception_pcl/pcl_ros/cfg/MLS.cfg', 'description': 'FLANN', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'organized', 'type': 'int', 'value': 2, 'srcline': 9, 'srcfile': '/workspace/catkin_ws/src/perception_pcl/pcl_ros/cfg/MLS.cfg', 'description': 'Dense/organized data locator', 'ctype': 'int', 'cconsttype': 'const int'}], 'enum_description': 'Set the spatial locator'}", 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'search_radius', 'type': 'double', 'default': 0.02, 'level': 0, 'description': 'Sphere radius for nearest neighbor search', 'min': 0.0, 'max': 0.5, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'use_polynomial_fit', 'type': 'bool', 'default': True, 'level': 0, 'description': 'Whether to use polynomial fit', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'polynomial_order', 'type': 'int', 'default': 2, 'level': 0, 'description': 'Set the spatial locator', 'min': 0, 'max': 5, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'gaussian_parameter', 'type': 'double', 'default': 0.02, 'level': 0, 'description': "How 'flat' should the neighbor weighting gaussian be (the smaller, the more local the fit)", 'min': 0.0, 'max': 0.5, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}], 'groups': [], 'srcline': 246, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'class': 'DEFAULT', 'parentclass': '', 'parentname': 'Default', 'field': 'default', 'upper': 'DEFAULT', 'lower': 'groups'}

min = {}
max = {}
defaults = {}
level = {}
type = {}
all_level = 0

#def extract_params(config):
#    params = []
#    params.extend(config['parameters'])
#    for group in config['groups']:
#        params.extend(extract_params(group))
#    return params

for param in extract_params(config_description):
    min[param['name']] = param['min']
    max[param['name']] = param['max']
    defaults[param['name']] = param['default']
    level[param['name']] = param['level']
    type[param['name']] = param['type']
    all_level = all_level | param['level']

MLS_ANN = 0
MLS_FLANN = 1
MLS_organized = 2
