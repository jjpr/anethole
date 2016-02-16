import bpy

filepath_input = "/Users/jjpr/Documents/Kitematic/2016-01-22-mayavi-experiments/data/notebooks/wrap_ruffle.obj"
filepath_output = "/Users/jjpr/Documents/Kitematic/2016-01-22-mayavi-experiments/data/notebooks/2016-02-16_wrapped_ruffle.stl"

bpy.ops.import_scene.obj(filepath=filepath_input)

obj = bpy.data.objects['grp1']
print(obj.name)

obj.modifiers.new("solidified", type="SOLIDIFY")
obj.modifiers["solidified"].thickness = 0.1
obj.modifiers["solidified"].offset = 0.0

bpy.ops.export_mesh.stl(filepath=filepath_output)
