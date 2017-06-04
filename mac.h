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

#ifndef Node_H_
#define Node_H_

#include <omnetpp.h>
#include "Mymessage_m.h"
#include <vector>
#include <map>
#include <queue>
using namespace std;
using namespace omnetpp;
enum state {
    wakeup = 1, sleeping = 2
};

class Node: public  cSimpleModule {
private:
    int state;
    simtime_t nextcome;
    simtime_t nextfire;
    simtime_t datacome;//本次的间隔
    queue<datapackage*> q;
    map<simtime_t,unsigned int> m;
    simtime_t lastcome;//上次的间隔
    bool isInited = false;
    bool isdatareceive=false;
    bool isackreceive=false;
    bool isoppo=false;

private:
    virtual void initialize() override;
    virtual void finish() override;
    virtual void handleMessage(cMessage *msg) override;
    template<class T> void broadcast(T * msg);
    void  predict();
    void changestate();
public:
    Node();
    virtual ~Node();
};

#endif /* Node_H_ */
