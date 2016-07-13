AUI.add("aui-live-search",function(m){var h=m.Lang,k=h.isString,j=h.isObject,a=h.isFunction,r=h.isValue,p=h.trim,w="",g="data",l="delay",q="hide",u="index",b="input",v="live-search",o="matchRegex",f="nodes",c="searchValue",e="show",d="*",t=m.Widget.UI_SRC,i="ENTER",n=function(x){return(x instanceof m.NodeList);};var s=m.Component.create({NAME:v,ATTRS:{data:{value:function(x){return x.html();},validator:a},delay:{value:250},hide:{value:function(x){return x.hide();},validator:a},index:{value:[],validator:j},input:{setter:m.one},matchRegex:{validator:function(x){return(x instanceof RegExp);},value:/(.)*/g},nodes:{setter:"_setNodes"},searchValue:{getter:"_getSearchValue",setter:String,value:""},show:{value:function(x){return x.show();},validator:a}},EXTENDS:m.Base,prototype:{normalizedQuery:w,query:w,timer:null,initializer:function(){var x=this;x.refreshIndex();x._fireSearchTask=m.debounce(x._fireSearchFn,x.get(l),x);x.bindUI();},bindUI:function(){var x=this;var y=x.get(b);y.on("keyup",x._inputKeyUp,x);x.after("searchValueChange",x._afterSearchValueChange);x.publish("search",{defaultFn:x._defSearchFn});},destroy:function(){var x=this;var y=x.get(b);y.detach("keyup");},filter:function(C){var x=this;var A=[];var y=x.get(f);var z=x.get(u);x.query=C;x.normalizedQuery=x._normalizeQuery(C);var B=new RegExp(x.normalizedQuery);m.each(z,function(F,D){var E=y.item(D);A.push({content:F,match:B.test(F),node:E});});return A;},refreshIndex:function(){var y=this;var x=[];var z=y.get(f);z.refresh();var A=y.get(g);z.each(function(D,B,E){var C=A.call(y,D);x.push(p(C).toLowerCase());});y.set(u,x);},search:function(y){var x=this;return x.set(c,y,{SRC:t});},_afterSearchValueChange:function(y){var x=this;if(y.SRC==t){x.get(b).val(y.newVal);}},_defSearchFn:function(z){var x=this;var B=x.get(c);var y=x.filter(B);m.Array.each(y,x._iterateResults,x);var A=m.namespace.call(z,"liveSearch");A.results=y;},_fireSearchFn:function(y){var x=this;x.set(c,y.currentTarget.val());x.fire("search",{liveSearch:{inputEvent:y}});},_getSearchValue:function(y){var x=this;if(!r(y)){y=x.get(b).val();}return y;},_iterateResults:function(A,z,B){var x=this;var y=q;if(A.match){y=e;}x.get(y).call(x,A.node);},_normalizeQuery:function(z){var x=this;var y=x.get(o);z=h.trim(z.toLowerCase());z=z.match(y).join(w);z=z.replace(d,w);z=m.Lang.String.escapeRegEx(z);return z;},_inputKeyUp:function(y){var x=this;if(y.isKey(i)){y.halt();}x._fireSearchTask(y);},_setNodes:function(y){var x=this;if(!n(y)){if(k(y)){y=m.all(y);}else{y=new m.NodeList([y]);}}return y;}}});m.LiveSearch=s;},"1.5.0",{requires:["aui-base"],skinnable:false});