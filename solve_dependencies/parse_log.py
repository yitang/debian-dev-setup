# import numpy as np
# import matplotlib.pyplot as plt

# from skimage import data
# from skimage.feature import match_template

import re
with open('installation_log.txt', 'r') as f:
    s = f.readlines()

re_lib_name = re.compile("Depends: (.*) \\(")  # wrong verison
re_lib_name = re.compile("Depends: (.*)) but")  # TODO: add this. xx not goning to install

all_cmd = []
for i in range(len(s)):
    lib = re_lib_name.findall(s[i])
    if lib:
        cmd = 'apt-get install -y --force-yes %s/stable' % lib[0]
        print(cmd)
        all_cmd.append(cmd)

temp_file = "install_dependencies.sh"
with open(temp_file, 'w') as f:
    for cmd in all_cmd:
        f.writelines(cmd + "\n")
