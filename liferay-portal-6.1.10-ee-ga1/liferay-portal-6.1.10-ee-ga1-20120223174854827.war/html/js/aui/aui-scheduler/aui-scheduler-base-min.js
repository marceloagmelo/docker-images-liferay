AUI.add("aui-scheduler-base",function(ak){var W=ak.Lang,aI=W.isString,G=W.isObject,b=W.isArray,f=W.isDate,P=W.isNumber,O=function(A){return(A instanceof ak.Scheduler);},x=function(A){return(A instanceof ak.SchedulerView);},ah=function(A){return(A instanceof ak.SchedulerEvent);},z=function(A){return(ak.SchedulerCalendar&&(A instanceof ak.SchedulerCalendar));},k=ak.DataType.DateMath,ad=ak.WidgetStdMod,aG="-",ab=".",s="",t=" ",v="scheduler-base",aq="data-view-name",M="activeView",r="boundingBox",aH="clearfix",L="controls",at="controlsNode",aw="current",aj="currentDate",af="currentDateNode",ar="date",ai="dateFormat",aC="day",ap="endDate",aJ="events",I="firstDayOfWeek",aO="hd",aF="headerNode",p="helper",Z="icon",m="iconNextNode",aB="iconPrevNode",aM="locale",h="month",o="name",X="nav",T="navNode",q="next",e="nextDate",aE="prev",au="prevDate",aN="rendered",S="scheduler",ax="srcNode",aL="startDate",J="strings",az="template",g="today",al="todayNode",B="triggerNode",E="view",aP="views",ae="viewsNode",V="week",w="year",aA="navigationDateFormat",U="eventRecorder",F=ak.getClassName,am=F(p,aH),l=F(Z),ay=F(v,L),aa=F(v,aw,ar),j=F(v,aO),ac=F(v,Z,q),H=F(v,Z,aE),aK=F(v,X),D=F(v,g),ag=F(v,E),u=F(v,aP),i=F(v,E,s),y=F(v,E,aC),a=F(v,E,h),c=F(v,E,V),ao=F(v,E,w),K=F(S,E,s),av='<div class="'+ay+'"></div>',C='<div class="'+aa+'"></div>',d='<div class="'+j+'"></div>',aQ='<a href="#" class="'+[l,ac].join(t)+'">Next</a>',an='<a href="#" class="'+[l,H].join(t)+'">Prev</a>',n='<div class="'+aK+'"></div>',Y='<a href="#" class="'+D+'">{today}</a>',aD='<a href="#" class="'+[ag,i].join(t)+'{name}" data-view-name="{name}">{label}</a>',Q='<div class="'+u+'"></div>';var R=function(){};R.ATTRS={events:{value:[],setter:"_setEvents",validator:b}};ak.mix(R.prototype,{addEvent:function(aR){var A=this;var aS=A.get(aJ);if(ak.Array.indexOf(aS,aR)>-1){ak.Array.removeItem(aS,aR);}aS.push(aR);A.set(aJ,aS);},addEvents:function(aR){var A=this;ak.Array.each(A._normalizeEvents(aR),ak.bind(A.addEvent,A));},eachEvent:function(aS){var A=this;var aR=A.get(aJ);ak.Array.each(aR,aS,A);},removeEvent:function(aR){var A=this;var aS=A.get(aJ);ak.Array.removeItem(aS,aR);A.set(aJ,aS);},removeEvents:function(aR){var A=this;ak.Array.each(A._normalizeEvents(aR),ak.bind(A.removeEvent,A));},_normalizeEvents:function(aS){var A=this;var aR=[];aS=ak.Array(aS);ak.Array.each(aS,function(aT,aU){if(ah(aT)){aR.push(aT);}else{if(z(aT)){aR=aR.concat(A._normalizeEvents(aT.get(aJ)));}else{aT=new ak.SchedulerEvent(aT);aR.push(aT);}}if(O(A)){aT.set(S,A);}});return aR;},_setEvents:function(aR){var A=this;return A._normalizeEvents(aR);}});ak.SchedulerEventSupport=R;var N=ak.Component.create({NAME:v,ATTRS:{activeView:{validator:x},eventRecorder:{setter:"_setEventRecorder"},strings:{value:{day:"Day",month:"Month",today:"Today",week:"Week",year:"Year"}},navigationDateFormat:{getter:function(aS){var A=this;var aR=A.get(M);if(aR){return aR.get(aA);}return aS;},value:"%A - %d %b %Y",validator:aI},views:{setter:"_setViews",value:[]},currentDate:{valueFn:function(){return new Date();},validator:f},firstDayOfWeek:{value:0,validator:P},controlsNode:{valueFn:function(){return ak.Node.create(av);}},currentDateNode:{valueFn:function(){return ak.Node.create(C);}},headerNode:{valueFn:function(){return ak.Node.create(d);}},iconNextNode:{valueFn:function(){return ak.Node.create(aQ);}},iconPrevNode:{valueFn:function(){return ak.Node.create(an);}},navNode:{valueFn:function(){return ak.Node.create(n);}},todayNode:{valueFn:function(){return ak.Node.create(this._processTemplate(Y));}},viewsNode:{valueFn:function(){return ak.Node.create(Q);}}},HTML_PARSER:{controlsNode:ab+ay,currentDateNode:ab+aa,headerNode:ab+j,iconNextNode:ab+ac,iconPrevNode:ab+H,navNode:ab+aK,todayNode:ab+D,viewsNode:ab+u},UI_ATTRS:[aj],AUGMENTS:[ak.SchedulerEventSupport,ak.WidgetStdMod],prototype:{viewStack:null,initializer:function(){var A=this;A.viewStack={};A.controlsNode=A.get(at);A.currentDateNode=A.get(af);A.iconNextNode=A.get(m);A.iconPrevNode=A.get(aB);A.navNode=A.get(T);A.schedulerHeaderNode=A.get(aF);A.todayNode=A.get(al);A.viewsNode=A.get(ae);A.after({render:A._afterRender,activeViewChange:A._afterActiveViewChange});},bindUI:function(){var A=this;A._bindDelegate();},syncUI:function(){var A=this;A.syncStdContent();},flushEvents:function(){var A=this;ak.Array.each(A.get(aJ),function(aR,aS){aR.eachRepeatedEvent(function(aU,aT){delete aU._filtered;});delete aR._filtered;});},getEventsByDay:function(aR){var A=this;aR=k.safeClearTime(aR);return A._getEvents(aR,function(aS){return k.compare(aS.getClearStartDate(),aR);});},getIntersectEvents:function(aR){var A=this;aR=k.safeClearTime(aR);return A._getEvents(aR,function(aT){var aS=aT.getClearStartDate();var aU=aT.getClearEndDate();return(k.compare(aR,aS)||k.compare(aR,aU)||k.between(aR,aS,aU));});},sortEventsByDateAsc:function(aR){var A=this;aR.sort(function(aV,aT){var aU=aV.get(ap);var aS=aT.get(ap);var aX=aV.get(aL);var aW=aT.get(aL);if(k.after(aX,aW)||k.compare(aX,aW)&&k.before(aU,aS)){return 1;}else{return -1;}});},getViewByName:function(aR){var A=this;return A.viewStack[aR];},getStrings:function(){var A=this;return A.get(J);},getString:function(aR){var A=this;return A.getStrings()[aR];},renderView:function(aR){var A=this;if(aR){aR.show();if(!aR.get(aN)){var aS=aR.get(o);if(!A.bodyNode){A.setStdModContent(ad.BODY,s);}aR.render(A.bodyNode);}}},plotViewEvents:function(aR){var A=this;aR.plotEvents(A.get(aJ));},syncEventsUI:function(){var A=this;A.plotViewEvents(A.get(M));},_afterActiveViewChange:function(aT){var aR=this;if(aR.get(aN)){var aS=aT.newVal;var A=aT.prevVal;if(A){A.hide();}aR.renderView(aS);}},_afterRender:function(aR){var A=this;A.renderView(A.get(M));},_bindDelegate:function(){var A=this;A.viewsNode.delegate("click",A._onClickViewTrigger,ab+ag,A);A.controlsNode.delegate("click",A._onClickPrevIcon,ab+H,A);A.controlsNode.delegate("click",A._onClickNextIcon,ab+ac,A);A.controlsNode.delegate("click",A._onClickToday,ab+D,A);},_createViewTriggerNode:function(aR){var A=this;
if(!aR.get(B)){var aS=aR.get(o);aR.set(B,ak.Node.create(W.sub(aD,{name:aS,label:(A.getString(aS)||aS)})));}return aR.get(B);},_getEvents:function(aR,aT){var A=this;var aS=A.get(aJ);var aU=[];ak.Array.each(aS,function(aV,aW){if(aT.apply(A,[aV])){aU.push(aV);}else{if(aV.isRepeatableDate(aR)){var aX=aV.repeatByDate(aR);aU.push(aX);}}});A.sortEventsByDateAsc(aU);return aU;},_onClickToday:function(aR){var A=this;A.set(aj,A.get(M).getToday());aR.preventDefault();},_onClickNextIcon:function(aR){var A=this;A.set(aj,A.get(M).get(e));aR.preventDefault();},_onClickPrevIcon:function(aR){var A=this;A.set(aj,A.get(M).get(au));aR.preventDefault();},_onClickViewTrigger:function(aS){var A=this;var aT=aS.currentTarget;var aU=aT.attr(aq);var aR=A.getViewByName(aU);A.set(M,aR);aS.preventDefault();},_processTemplate:function(aR){var A=this;return W.sub(aR,A.getStrings());},_setEventRecorder:function(aR){var A=this;if(aR){aR.set(S,A);}},_setViews:function(aS){var A=this;var aR=[];ak.Array.each(aS,function(aT){if(x(aT)&&!aT.get(aN)){aT.set(S,A);aR.push(aT);A.viewStack[aT.get(o)]=aT;}});if(!A.get(M)){A.set(M,aS[0]);}return aR;},syncStdContent:function(){var A=this;var aR=A.get(aP);A.navNode.append(A.iconPrevNode);A.navNode.append(A.iconNextNode);A.controlsNode.append(A.todayNode);A.controlsNode.append(A.navNode);A.controlsNode.append(A.currentDateNode);ak.Array.each(aR,function(aS){A.viewsNode.append(A._createViewTriggerNode(aS));});A.schedulerHeaderNode.append(A.controlsNode);A.schedulerHeaderNode.append(A.viewsNode);A.schedulerHeaderNode.addClass(am);A.setStdModContent(ad.HEADER,A.schedulerHeaderNode.getDOM());},_uiSetCurrentDate:function(aV){var aS=this;var aR=aS.get(aA);var A=aS.get(aM);var aU=ak.DataType.Date.format(aV,{format:aR,locale:A});aS.currentDateNode.html(aU);if(aS.get(aN)){var aT=aS.get(M);if(aT){aT._uiSetCurrentDate(aV);}aS.syncEventsUI();}}}});ak.Scheduler=N;},"1.5.0",{skinnable:true,requires:["aui-scheduler-view","datasource"]});