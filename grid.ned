//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

// Created: 2017-2-18 for project MAC

package mac;

import mac.Node;

import ned.DelayChannel;

//
// A generated network with grid topology.
//
network Grid
{
    submodules:
        node_0_0: Node {
            @display("p=50,50");
            gates: g[4];
        }
        node_0_1: Node {
            @display("p=50,125");
            gates: g[4];
        }
        node_0_2: Node {
            @display("p=50,200");
            gates: g[4];
        }
        node_0_3: Node {
            @display("p=50,275");
            gates: g[4];
        }
        node_0_4: Node {
            @display("p=50,350");
            gates: g[4];
        }
        node_0_5: Node {
            @display("p=50,425");
            gates: g[4];
        }
        node_0_6: Node {
            @display("p=50,500");
            gates: g[4];
        }

        node_1_0: Node {
            @display("p=125,50");
            gates: g[4];
        }
        node_1_1: Node {
            @display("p=125,125");
            gates: g[4];
        }
        node_1_2: Node {
            @display("p=125,200");
            gates: g[4];
        }
        node_1_3: Node {
            @display("p=125,275");
            gates: g[4];
        }
        node_1_4: Node {
            @display("p=125,350");
            gates: g[4];
        }
        node_1_5: Node {
            @display("p=125,425");
            gates: g[4];
        }
        node_1_6: Node {
            @display("p=125,500");
            gates: g[4];
        }

        node_2_0: Node {
            @display("p=200,50");
            gates: g[4];
        }
        node_2_1: Node {
            @display("p=200,125");
            gates: g[4];
        }
        node_2_2: Node {
            @display("p=200,200");
            gates: g[4];
        }
        node_2_3: Node {
            @display("p=200,275");
            gates: g[4];
        }
        node_2_4: Node {
            @display("p=200,350");
            gates: g[4];
        }
        node_2_5: Node {
            @display("p=200,425");
            gates: g[4];
        }
        node_2_6: Node {
            @display("p=200,500");
            gates: g[4];
        }

        node_3_0: Node {
            @display("p=275,50");
            gates: g[4];
        }
        node_3_1: Node {
            @display("p=275,125");
            gates: g[4];
        }
        node_3_2: Node {
            @display("p=275,200");
            gates: g[4];
        }
        node_3_3: Node {
            @display("p=275,275");
            gates: g[4];
        }
        node_3_4: Node {
            @display("p=275,350");
            gates: g[4];
        }
        node_3_5: Node {
            @display("p=275,425");
            gates: g[4];
        }
        node_3_6: Node {
            @display("p=275,500");
            gates: g[4];
        }

        node_4_0: Node {
            @display("p=350,50");
            gates: g[4];
        }
        node_4_1: Node {
            @display("p=350,125");
            gates: g[4];
        }
        node_4_2: Node {
            @display("p=350,200");
            gates: g[4];
        }
        node_4_3: Node {
            @display("p=350,275");
            gates: g[4];
        }
        node_4_4: Node {
            @display("p=350,350");
            gates: g[4];
        }
        node_4_5: Node {
            @display("p=350,425");
            gates: g[4];
        }
        node_4_6: Node {
            @display("p=350,500");
            gates: g[4];
        }

        node_5_0: Node {
            @display("p=425,50");
            gates: g[4];
        }
        node_5_1: Node {
            @display("p=425,125");
            gates: g[4];
        }
        node_5_2: Node {
            @display("p=425,200");
            gates: g[4];
        }
        node_5_3: Node {
            @display("p=425,275");
            gates: g[4];
        }
        node_5_4: Node {
            @display("p=425,350");
            gates: g[4];
        }
        node_5_5: Node {
            @display("p=425,425");
            gates: g[4];
        }
        node_5_6: Node {
            @display("p=425,500");
            gates: g[4];
        }

        node_6_0: Node {
            @display("p=500,50");
            gates: g[4];
        }
        node_6_1: Node {
            @display("p=500,125");
            gates: g[4];
        }
        node_6_2: Node {
            @display("p=500,200");
            gates: g[4];
        }
        node_6_3: Node {
            @display("p=500,275");
            gates: g[4];
        }
        node_6_4: Node {
            @display("p=500,350");
            gates: g[4];
        }
        node_6_5: Node {
            @display("p=500,425");
            gates: g[4];
        }
        node_6_6: Node {
            @display("p=500,500");
            gates: g[4];
        }

    connections allowunconnected:
        node_0_0.g[1] <--> DelayChannel <--> node_1_0.g[0];
        node_0_0.g[3] <--> DelayChannel <--> node_0_1.g[2];
        node_0_1.g[1] <--> DelayChannel <--> node_1_1.g[0];
        node_0_1.g[3] <--> DelayChannel <--> node_0_2.g[2];
        node_0_2.g[1] <--> DelayChannel <--> node_1_2.g[0];
        node_0_2.g[3] <--> DelayChannel <--> node_0_3.g[2];
        node_0_3.g[1] <--> DelayChannel <--> node_1_3.g[0];
        node_0_3.g[3] <--> DelayChannel <--> node_0_4.g[2];
        node_0_4.g[1] <--> DelayChannel <--> node_1_4.g[0];
        node_0_4.g[3] <--> DelayChannel <--> node_0_5.g[2];
        node_0_5.g[1] <--> DelayChannel <--> node_1_5.g[0];
        node_0_5.g[3] <--> DelayChannel <--> node_0_6.g[2];
        node_0_6.g[1] <--> DelayChannel <--> node_1_6.g[0];
        
        node_1_0.g[1] <--> DelayChannel <--> node_2_0.g[0];
        node_1_0.g[3] <--> DelayChannel <--> node_1_1.g[2];
        node_1_1.g[1] <--> DelayChannel <--> node_2_1.g[0];
        node_1_1.g[3] <--> DelayChannel <--> node_1_2.g[2];
        node_1_2.g[1] <--> DelayChannel <--> node_2_2.g[0];
        node_1_2.g[3] <--> DelayChannel <--> node_1_3.g[2];
        node_1_3.g[1] <--> DelayChannel <--> node_2_3.g[0];
        node_1_3.g[3] <--> DelayChannel <--> node_1_4.g[2];
        node_1_4.g[1] <--> DelayChannel <--> node_2_4.g[0];
        node_1_4.g[3] <--> DelayChannel <--> node_1_5.g[2];
        node_1_5.g[1] <--> DelayChannel <--> node_2_5.g[0];
        node_1_5.g[3] <--> DelayChannel <--> node_1_6.g[2];
        node_1_6.g[1] <--> DelayChannel <--> node_2_6.g[0];
        
        node_2_0.g[1] <--> DelayChannel <--> node_3_0.g[0];
        node_2_0.g[3] <--> DelayChannel <--> node_2_1.g[2];
        node_2_1.g[1] <--> DelayChannel <--> node_3_1.g[0];
        node_2_1.g[3] <--> DelayChannel <--> node_2_2.g[2];
        node_2_2.g[1] <--> DelayChannel <--> node_3_2.g[0];
        node_2_2.g[3] <--> DelayChannel <--> node_2_3.g[2];
        node_2_3.g[1] <--> DelayChannel <--> node_3_3.g[0];
        node_2_3.g[3] <--> DelayChannel <--> node_2_4.g[2];
        node_2_4.g[1] <--> DelayChannel <--> node_3_4.g[0];
        node_2_4.g[3] <--> DelayChannel <--> node_2_5.g[2];
        node_2_5.g[1] <--> DelayChannel <--> node_3_5.g[0];
        node_2_5.g[3] <--> DelayChannel <--> node_2_6.g[2];
        node_2_6.g[1] <--> DelayChannel <--> node_3_6.g[0];
        
        node_3_0.g[1] <--> DelayChannel <--> node_4_0.g[0];
        node_3_0.g[3] <--> DelayChannel <--> node_3_1.g[2];
        node_3_1.g[1] <--> DelayChannel <--> node_4_1.g[0];
        node_3_1.g[3] <--> DelayChannel <--> node_3_2.g[2];
        node_3_2.g[1] <--> DelayChannel <--> node_4_2.g[0];
        node_3_2.g[3] <--> DelayChannel <--> node_3_3.g[2];
        node_3_3.g[1] <--> DelayChannel <--> node_4_3.g[0];
        node_3_3.g[3] <--> DelayChannel <--> node_3_4.g[2];
        node_3_4.g[1] <--> DelayChannel <--> node_4_4.g[0];
        node_3_4.g[3] <--> DelayChannel <--> node_3_5.g[2];
        node_3_5.g[1] <--> DelayChannel <--> node_4_5.g[0];
        node_3_5.g[3] <--> DelayChannel <--> node_3_6.g[2];
        node_3_6.g[1] <--> DelayChannel <--> node_4_6.g[0];
        
        node_4_0.g[1] <--> DelayChannel <--> node_5_0.g[0];
        node_4_0.g[3] <--> DelayChannel <--> node_4_1.g[2];
        node_4_1.g[1] <--> DelayChannel <--> node_5_1.g[0];
        node_4_1.g[3] <--> DelayChannel <--> node_4_2.g[2];
        node_4_2.g[1] <--> DelayChannel <--> node_5_2.g[0];
        node_4_2.g[3] <--> DelayChannel <--> node_4_3.g[2];
        node_4_3.g[1] <--> DelayChannel <--> node_5_3.g[0];
        node_4_3.g[3] <--> DelayChannel <--> node_4_4.g[2];
        node_4_4.g[1] <--> DelayChannel <--> node_5_4.g[0];
        node_4_4.g[3] <--> DelayChannel <--> node_4_5.g[2];
        node_4_5.g[1] <--> DelayChannel <--> node_5_5.g[0];
        node_4_5.g[3] <--> DelayChannel <--> node_4_6.g[2];
        node_4_6.g[1] <--> DelayChannel <--> node_5_6.g[0];
        
        node_5_0.g[1] <--> DelayChannel <--> node_6_0.g[0];
        node_5_0.g[3] <--> DelayChannel <--> node_5_1.g[2];
        node_5_1.g[1] <--> DelayChannel <--> node_6_1.g[0];
        node_5_1.g[3] <--> DelayChannel <--> node_5_2.g[2];
        node_5_2.g[1] <--> DelayChannel <--> node_6_2.g[0];
        node_5_2.g[3] <--> DelayChannel <--> node_5_3.g[2];
        node_5_3.g[1] <--> DelayChannel <--> node_6_3.g[0];
        node_5_3.g[3] <--> DelayChannel <--> node_5_4.g[2];
        node_5_4.g[1] <--> DelayChannel <--> node_6_4.g[0];
        node_5_4.g[3] <--> DelayChannel <--> node_5_5.g[2];
        node_5_5.g[1] <--> DelayChannel <--> node_6_5.g[0];
        node_5_5.g[3] <--> DelayChannel <--> node_5_6.g[2];
        node_5_6.g[1] <--> DelayChannel <--> node_6_6.g[0];
        
        
        node_6_0.g[3] <--> DelayChannel <--> node_6_1.g[2];
        
        node_6_1.g[3] <--> DelayChannel <--> node_6_2.g[2];
        
        node_6_2.g[3] <--> DelayChannel <--> node_6_3.g[2];
        
        node_6_3.g[3] <--> DelayChannel <--> node_6_4.g[2];
        
        node_6_4.g[3] <--> DelayChannel <--> node_6_5.g[2];
        
        node_6_5.g[3] <--> DelayChannel <--> node_6_6.g[2];
        
        
}
