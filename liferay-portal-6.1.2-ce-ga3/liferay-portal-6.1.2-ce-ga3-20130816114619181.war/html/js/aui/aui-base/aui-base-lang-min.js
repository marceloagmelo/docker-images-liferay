AUI.add("aui-base-lang",function(l){var O=l.Lang,r=l.Array,m=l.Object,v=O.isArray,N=O.isNumber,n=O.isUndefined,C=m.owns,K=l.namespace("Lang.String"),x="",B=l.config.doc,H="innerHTML",g="normalize",c=/-([a-z])/gi,e=/([.*+?^$(){}|[\]\/\\])/g,D=/\r?\n/g,y=/(?:<script.*?>)((\n|\r|.)*?)(?:<\/script>)/gi,I=/<\/?[^>]+>/gi,G=/([a-zA-Z][a-zA-Z])([A-Z])([a-z])/g,b=/([a-zA-Z][a-zA-Z])([A-Z])([a-z])/g,z="&",q="<",j="...",M="end",f="#",L="middle",F="start",o="0",w="g",p="s",h=["return value ",null,";"],d=[],u=l.cached(function(i){h[1]=i;return new Function("value",h.join(x));}),a={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&#034;","'":"&#039;","/":"&#047;","`":"&#096;"},k={};for(var J in a){if(a.hasOwnProperty(J)){var E=a[J];k[E]=J;d.push(J);}}var t=new RegExp("["+d.join(x)+"]","g"),s=/&([^;]+);/g;l.mix(K,{camelize:l.cached(function(P,A){var i=c;P=String(P);if(A){i=new RegExp(A+"([a-z])","gi");}return P.replace(i,K._camelize);}),capitalize:l.cached(function(i){if(i){i=String(i);i=i.charAt(0).toUpperCase()+i.substr(1).toLowerCase();}return i;}),contains:function(A,i){return A.indexOf(i)!=-1;},defaultValue:function(A,i){if(n(A)||A==x){if(n(i)){i=x;}A=i;}return A;},endsWith:function(P,A){var i=(P.length-A.length);return((i>=0)&&(P.indexOf(A,i)==i));},escapeHTML:function(i){return i.replace(t,K._escapeHTML);},escapeRegEx:function(i){return i.replace(e,"\\$1");},math:function(A,i){return u(i)(A);},nl2br:function(A){var i=this;return String(A).replace(D,"<br />");},padNumber:function(P,Q,i){var R=i?Number(P).toFixed(i):String(P);var A=R.indexOf(".");if(A==-1){A=R.length;}return K.repeat(o,Math.max(0,Q-A))+R;},pluralize:function(A,i,Q){var P;if(A==1){P=i;}else{P=Q||i+p;}return A+" "+P;},prefix:function(i,A){A=String(A);if(A.indexOf(i)!==0){A=i+A;}return A;},remove:function(Q,i,P){var A=new RegExp(K.escapeRegEx(i),P?w:x);return Q.replace(A,x);},removeAll:function(A,i){return K.remove(A,i,true);},repeat:function(A,i){return new Array(i+1).join(A);},round:function(A,i){A=Number(A);if(N(i)){i=Math.pow(10,i);A=Math.round(A*i)/i;}return A;},startsWith:function(A,i){return(A.lastIndexOf(i,0)===0);},stripScripts:function(i){if(i){i=String(i).replace(y,x);}return i;},stripTags:function(A){var i=this;if(A){A=String(A).replace(I,x);}return A;},substr:function(A,P,i){return String(A).substr(P,i);},uncamelize:l.cached(function(A,i){i=i||" ";A=String(A);A=A.replace(G,"$1"+i+"$2$3");A=A.replace(b,"$1"+i+"$2");return A;}),toLowerCase:function(i){return String(i).toLowerCase();},toUpperCase:function(i){return String(i).toUpperCase();},trim:O.trim,truncate:function(R,Q,i){R=String(R);var P=R.length;if(R&&P>Q){i=i||M;if(i==M){R=R.substr(0,Q-j.length)+j;}else{if(i==L){var A=Math.floor(Q/2);R=R.substr(0,A)+j+R.substr(P-A);}else{if(i==F){R=j+R.substr(P-Q);}}}}return R;},undef:function(i){if(n(i)){i=x;}return i;},unescapeEntities:function(i){if(K.contains(i,z)){if(B&&!K.contains(i,q)){i=K._unescapeEntitiesUsingDom(i);}else{i=K.unescapeHTML(i);}}return i;},unescapeHTML:function(i){return i.replace(s,K._unescapeHTML);},_camelize:function(i,A){return A.toUpperCase();},_escapeHTML:function(i){return a[i];},_unescapeHTML:function(A){var P=k[A];if(!P&&entity.charAt(0)==f){var i=Number(o+entity.substr(1));if(!isNaN(i)){P=String.fromCharCode(i);}}return P;},_unescapeEntitiesUsingDom:function(A){var i=K._unescapeNode;i[H]=A;if(i[g]){i[g]();}A=i.firstChild.nodeValue;i[H]=x;return A;},_unescapeNode:B.createElement("a")});l.mix(r,{stableSort:function(R,Q){var P,A=R.length;for(P=0;P<A;P++){R[P]={index:P,value:R[P]};}R.sort(function(T,S){var i=Q.call(R,T.value,S.value);return(i===0)?(T.index-S.index):i;});for(P=0;P<A;P++){R[P]=R[P].value;}}});l.mix(O,{emptyFn:function(){},emptyFnFalse:function(){return false;},emptyFnTrue:function(){return true;},isGuid:function(i){return String(i).indexOf(l.Env._guidp)===0;},toFloat:function(A,i){return parseFloat(A)||i||0;},toInt:function(P,A,i){return parseInt(P,A||10)||i||0;}});m.map=function(S,Q,P){var R=[];for(var A in S){if(C(S,A)){R[R.length]=Q.call(P,S[A],A,S);}}return R;};l.map=function(Q,P,A){var i=m;if(v(Q)){i=r;}return i.map.apply(this,arguments);};},"1.5.2",{skinnable:false});