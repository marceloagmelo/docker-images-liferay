AUI.add("aui-char-counter",function(b){var i=b.Lang,j=i.isNumber,a="char-counter",f="counter",h="input",e="maxLength",d="scrollLeft",g="scrollTop";var c=b.Component.create({NAME:a,ATTRS:{counter:{setter:b.one},maxLength:{lazyAdd:false,setter:function(k){return this._setMaxLength(k);},value:Infinity,validator:j},input:{setter:b.one}},EXTENDS:b.Base,prototype:{handler:null,initializer:function(){var k=this;k.bindUI();k.checkLength();},bindUI:function(){var k=this;var l=k.get(h);k.publish("maxLength");k.after("maxLengthChange",k.checkLength);if(l){k.handler=l.on(h,b.bind(k._onInputChange,k));}},syncUI:function(){var k=this;var l=k.get(f);if(l){var m=k.get(h).val();l.html(k.get(e)-m.length);}},destroy:function(){var k=this;if(k.handler){k.handler.detach();}},checkLength:function(){var k=this;var m=k.get(h);var l=k.get(e);if(!m){return false;}var n=m.val();var o=m.get(g);var p=m.get(d);if(n.length>l){m.val(n.substring(0,l));}if(n.length==l){k.fire("maxLength");}m.set(g,o);m.set(d,p);k.syncUI();},_onInputChange:function(l){var k=this;k.checkLength();},_setMaxLength:function(m){var k=this;var l=k.get(h);if(l&&(m<Infinity)){l.set(e,m);}return m;}}});b.CharCounter=c;},"1.5.0",{requires:["aui-base","aui-event-input"],skinnable:false});