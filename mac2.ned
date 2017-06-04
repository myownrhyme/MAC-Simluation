package mac;

network random2
{
    
    types:
        channel Channel extends ned.DelayChannel
        {
            //delay = uniform(20us,30us);
            delay = 100ms;
        }
        channel Channel2 extends ned.DelayChannel
        {
            delay = uniform(100us,500us) ;
        }
    submodules:
        node[9]: mac.Node;
    connections:
        node[0].g++ <--> Channel <--> node[1].g++;
        node[1].g++ <--> Channel <--> node[2].g++;
        node[2].g++ <--> Channel <--> node[3].g++;
        node[3].g++ <--> Channel <--> node[4].g++;
        node[4].g++ <--> Channel <--> node[5].g++;
        node[5].g++ <--> Channel <--> node[6].g++;
        node[6].g++ <--> Channel <--> node[7].g++;
        node[7].g++ <--> Channel <--> node[8].g++;
}

