# NS3-SUMO-EVALVID
NS3 with mobility applied by SUMO, including sending of streamming files (Evalvid)

These files were used to develop the results in the Paper Performance Analysis of IEEE 802.11p and IEEE 802.11n based on QoS for UAV networks.

1. Firstly, you need to install the NS-3.2x versions or lastest versions. In case of UBUNTU 18.04, I recommend versions upper than ns-3.29.

$ wget http://www.nsnam.org/release/ns-allinone-3.29.tar.bz2

2. For this installation, we use the steps in this link https://www.nsnam.org/wiki/Installation

3. Run a test to verify the NS-3 execution. Go to the ns-allinone-3.29/ns-3.29 directory.

$ ./test.py -c core
$ ./waf –run hello-simulator

4. For instalation of SUMO simulator:

$ sudo add-apt-repository ppa:sumo/stable
$ sudo apt-get update
$ sudo apt-get install sumo sumo-tools sumo-doc

5. Add environment variable:
$ SUMO_HOME="/usr/share/sumo"
$ export SUMO_HOME
$ source ~/.bashrc

6. To generate mobility files, you need to develop three files .nod, .ed, the example is in Perfomance_Evaluation/sumo-examples/fanet/10_speed
The fanet.nod.xml define the points of junction of paths connected by lines described in fanet.edg.xml. These points and lines are connected using netconvert generating the fanet.net.xml
$ netconvert -n fanet.nod.xml -e fanet.edg.xml -o fanet.net.xml




