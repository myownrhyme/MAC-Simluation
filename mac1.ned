
package mac;


simple Node
{
    parameters:

        @display("i=misc/node2;is=vs");
    gates:
        inout g[];
}
//
// Same as nodetoc12
//
network random1
{
    
    types:
        channel Channel extends ned.DelayChannel
        {
            //delay = ;
            delay =0us ;
        }
        channel Channel2 extends ned.DelayChannel
        {
            delay = uniform(10us,20us);
        }
    submodules:
        node[3]: Node;
    connections:
        node[0].g++ <--> Channel <--> node[1].g++;
         node[0].g++ <--> Channel <--> node[2].g++;
}

