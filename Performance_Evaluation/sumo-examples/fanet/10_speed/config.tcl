# set number of nodes
set opt(nn) 3

# set activity file
set opt(af) $opt(config-path)
append opt(af) /activity.tcl

# set mobility file
set opt(mf) $opt(config-path)
append opt(mf) /mobility.tcl

# set start/stop time
set opt(start) 0.0
set opt(stop) 90.0

# set floor size
set opt(x) 300.95
set opt(y) 401.43
set opt(min-x) 17.54
set opt(min-y) 25.18

