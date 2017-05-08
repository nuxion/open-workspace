# Open Workspace
Script for open and setup workspaces in i3wm, with a specify layout setting, using i3-msg command

## How this work
### 1. Clone git repository:

```
> $ git clone https://github.com/nuxion/open-workspace.git
> $ cd open-workspace
> $ cat README.md
```

### 2. Set your key binding for your workspace:

```
> $ cat ~/.config/i3/config | grep open-workspace   
bindsym $mod+F2 exec "/path/to/script/open-workspace/openWorkspace.sh  <name-of-file-with-properties-defined>"
```

_we need call the file without  '.props' extension._

### 3. Modify openWorkspace.sh to set the correct path to the script:

__> $ vi openWorkspace.sh__
```
home="/home/yourhome"
pathConfigs=$home"/path/to/script/open-workspace"

```
### 4. Set your properties file. 

_The name of the file must be the same that we use to call the script:_  <name-of-file-with-properties-defined>

__> $ vi example.props__

```
# Its' very important that you be careful with the
# names in your layout path file and workspace name, 
# because to take the values, the script use grep rules 
workspaceName="2:"
layoutName=/home/nuxion/.config/i3/workspace2_dev.json
app=kate
app=google-chrome
app=i3-sensible-terminal
app=i3-sensible-terminal
```
app='must be the name of WM_CLASS'. You can see more explitacion at https://i3wm.org/docs/userguide.html#assign_workspace

About how to create layouts in json, go to: https://i3wm.org/docs/layout-saving.html

