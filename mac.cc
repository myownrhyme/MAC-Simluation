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

#include "mac.h"
#include "Mymessage_m.h"

Node::Node() {
    // TODO Auto-generated constructor stub

}

Node::~Node() {
    // TODO Auto-generated destructor stub
}

Define_Module(Node);

void Node::initialize() {
    state = wakeup;
    if (getIndex() == 0) {
        cMessage *init = new cMessage("init");
        broadcast<cMessage>(init);
    }
    if (getIndex() != 0) {
        cMessage *generatedata = new cMessage("generatedata");
        simtime_t t =4;
        scheduleAt(t, generatedata);

    }
}
void Node::handleMessage(cMessage *msg) {
    if (msg->isSelfMessage()) {
        if (!strcmp(msg->getName(), "generatedata")) {//新数据到达
            datapackage * data = new datapackage("data");
            data->setNodeid(getIndex());
            data->setDatatype(2);
            q.push(data);
            EV << "data generated at "<< simTime()<<" size is "<<q.size()<<"\n";
            cMessage *generatedata = new cMessage("generatedata");
            scheduleAt(simTime() + 4, generatedata);
            //机会先发策略
            if(1){//时间未过半，启用机会先发
                isoppo=true;
                state=wakeup;
            }

        }
        if (!strcmp(msg->getName(), "receive_beacon")) {
            changestate();
            cMessage *changestate = new cMessage("changestate");
            scheduleAt(simTime() + 0.005, changestate);
        }
        if (!strcmp(msg->getName(), "changestate")) {
            changestate();
            cMessage *receive_beacon = new cMessage("receive_beacon");
            scheduleAt(simTime() + nextcome, receive_beacon);
        }
        if (!strcmp(msg->getName(), "changestateasreceive")) {
            changestate();
            cMessage *send_beacon = new cMessage("send_beacon");
            scheduleAt(simTime() + nextfire, send_beacon);
        }
        if (!strcmp(msg->getName(), "send_beacon")) {
            EV<<"node "<<getIndex()<< "send beacon\n";
            changestate();
            datapackage *beacon = new datapackage("beacon");
            beacon->setNodeid(m[simTime()]);
            EV << "send beacon to "<<m[simTime()]<<"  "<< simTime()<<"\n";
            beacon->setDatatype(1);
            m.erase(simTime());
            broadcast<cMessage>(beacon);
            cMessage *changestateasreceive = new cMessage("changestateasreceive");
            scheduleAt(simTime() + 0.005, changestateasreceive);//接收节点每次醒来的时间
//            cMessage *send_beacon = new cMessage("send_beacon");
//            scheduleAt(simTime() + 5, send_beacon);
        }
    } else {
        if (!strcmp(msg->getName(), "init")) {
            simtime_t t = uniform(3,5);
            InitAck *initack = new InitAck("initack");
            initack->setAck(t);
            int n = (msg->getArrivalGateId()
                    - msg->getArrivalGate()->getBaseId());
            send(initack, "g$o", n);
            state = sleeping;
            cMessage *receive_beacon = new cMessage("receive_beacon");
            scheduleAt(simTime() + t, receive_beacon);
        }
        if (!strcmp(msg->getName(), "initack")) {
            cMessage *send_beacon = new cMessage("send_beacon");
            InitAck *t = check_and_cast<InitAck*>(msg);
            m[simTime() + t->getAck()] = t->getSenderModule()->getIndex();
            EV<< simTime() + t->getAck()<< " 12312313\n";
            scheduleAt(simTime() + t->getAck(), send_beacon);
            state = sleeping;
        }
        if (!strcmp(msg->getName(), "beacon")) {
            EV << "beacon receive and state is " << state <<" , time is " <<simTime() <<"\n";
            if (state == wakeup) {
                datapackage * t = check_and_cast<datapackage*>(msg);
                EV<< getIndex() << " "<<t->getNodeid();
                if (t->getNodeid() == getIndex()) {
                    if (!q.empty()) {
                        datapackage * data = q.front();
                        q.pop();
                        data->setDelay(5);
                        nextcome=5;
                        int n = (t->getArrivalGateId()
                                - t->getArrivalGate()->getBaseId());
                        send(data, "g$o", n);
                        EV << "data send\n";
                    } else {
                        //没数据发送，用上一次的时间休眠。
                    }
                }
            }
        }
        if (!strcmp(msg->getName(), "data") && state == wakeup) {
            EV<<"node "<<getIndex()<< "receive data\n";
            isdatareceive = true;
            datapackage *t = check_and_cast<datapackage*>(msg);
            m[simTime() + t->getDelay()+ 0.005] = t->getSenderModule()->getIndex();
            EV<<simTime()+t->getDelay()+0.005<<"\n";
            datapackage* dataack = new datapackage("dataack");
            dataack->setDatatype(3);

            int n = (msg->getArrivalGateId()
                    - msg->getArrivalGate()->getBaseId());
            dataack->setNodeid(n);
            send(dataack, "g$o", n);
            nextfire = t->getDelay();
//            cMessage *receive_beacon = new cMessage(
//                                           "receive_beacon");
//            scheduleAt(simTime() + t->getDelay(), receive_beacon);
        }
        if (!strcmp(msg->getName(), "dataack") && state == wakeup) {

            EV<<"node "<<getIndex()<< "receive data ack at "<<simTime()<<"\n";
            //用这次的休眠
            EV << "ACK receive \n";
            datapackage *t = check_and_cast<datapackage*>(msg);
            if(t->getNodeid()==getIndex()){
            m[simTime() + t->getDelay()] = t->getSenderModule()->getIndex();}
            if(t->getNodeid()==getIndex() && isoppo){

            }
        }
    }

}

template<class T>
void Node::broadcast(T * msg) {
    int n = gateSize("g");
    for (int i = 0; i < n; i++) {
        T *copy = msg->dup();
        send(copy, "g$o", i);
    }
    cancelAndDelete(msg);
}

void Node::finish() {
}

void Node::predict() {

}

void Node::changestate() {
    if (state == wakeup){
        state = sleeping;
        EV<< "node sleep at "<<simTime()<<"\n";
    }
    else {
        state = wakeup;
        EV<<"node wakeup at "<<simTime()<<"\n";
    }
}
