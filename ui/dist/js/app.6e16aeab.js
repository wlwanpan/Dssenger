(function(t){function e(e){for(var a,i,o=e[0],c=e[1],u=e[2],d=0,m=[];d<o.length;d++)i=o[d],r[i]&&m.push(r[i][0]),r[i]=0;for(a in c)Object.prototype.hasOwnProperty.call(c,a)&&(t[a]=c[a]);l&&l(e);while(m.length)m.shift()();return s.push.apply(s,u||[]),n()}function n(){for(var t,e=0;e<s.length;e++){for(var n=s[e],a=!0,o=1;o<n.length;o++){var c=n[o];0!==r[c]&&(a=!1)}a&&(s.splice(e--,1),t=i(i.s=n[0]))}return t}var a={},r={1:0},s=[];function i(e){if(a[e])return a[e].exports;var n=a[e]={i:e,l:!1,exports:{}};return t[e].call(n.exports,n,n.exports,i),n.l=!0,n.exports}i.m=t,i.c=a,i.d=function(t,e,n){i.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},i.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},i.t=function(t,e){if(1&e&&(t=i(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(i.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var a in t)i.d(n,a,function(e){return t[e]}.bind(null,a));return n},i.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return i.d(e,"a",e),e},i.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},i.p="/";var o=window["webpackJsonp"]=window["webpackJsonp"]||[],c=o.push.bind(o);o.push=e,o=o.slice();for(var u=0;u<o.length;u++)e(o[u]);var l=c;s.push([13,0]),n()})({13:function(t,e,n){t.exports=n("Vtdi")},"44JG":function(t,e,n){},D7Ho:function(t,e,n){},Hx0h:function(t,e,n){"use strict";var a=n("cbFo"),r=n.n(a);r.a},K1DL:function(t,e,n){},Kdfm:function(t,e,n){"use strict";var a=n("sfI2"),r=n.n(a);r.a},RjOz:function(t,e,n){"use strict";var a=n("gl9u"),r=n.n(a);r.a},SspD:function(t,e,n){"use strict";var a=n("K1DL"),r=n.n(a);r.a},SwFd:function(t,e,n){"use strict";var a=n("YaQq"),r=n.n(a);r.a},Vtdi:function(t,e,n){"use strict";n.r(e);n("VRzm");var a=n("Kw5r"),r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"app"}},[n("login-dialog",{attrs:{showDialog:t.showDialog[0]},on:{"login-user":t.loginUser,"show-register-dialog":function(e){t.switchTo(1)}}}),n("register-dialog",{attrs:{showDialog:t.showDialog[1]},on:{"close-dialog":function(e){t.switchTo(0)}}}),n("error-dialog",{attrs:{title:t.error.title,message:t.error.message,showDialog:t.showDialog[2]},on:{"close-dialog":t.resetError}}),n("chat",{attrs:{user:t.user}})],1)},s=[],i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"chat"}},[n("contacts",{attrs:{user:t.user}}),n("div",{attrs:{id:"message-container"}},[n("message-box",{attrs:{user:t.user}}),n("input-box",{attrs:{user:t.user}})],1),n("div",{attrs:{id:"buffer"}},[n("md-empty-state",{staticClass:"md-primary",attrs:{"md-label":"Account","md-description":t.description}},[n("md-avatar",{staticClass:"md-avatar-icon md-large"},[n("img",{attrs:{src:t.userAvatar,alt:"Avatar"}})])],1),n("md-button",{staticClass:"md-dense md-raised md-primary",on:{click:function(e){return e.preventDefault(),t.logout(e)}}},[t._v("Logout")])],1)],1)},o=[],c=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"contacts"}},[n("add-contact-dialog",{attrs:{user:t.user,showDialog:t.showAddContact},on:{"close-dialog":function(e){t.showAddContact=!1},"on-selected":t.onSelect}}),n("div",{staticClass:"contact-list"},[t.contactList.length?n("div",[n("h1",[t._v("Contacts")]),t._l(t.contactList,function(t,e){return n("contact-item",{key:e,class:["contact-"+e,0===e?"selected":""],attrs:{contact:t,index:e}})})],2):t.loadingContacts?n("div",[n("md-empty-state",{attrs:{"md-label":"Loading ...","md-description":"Retrieving your contact list."}})],1):n("div",[n("md-empty-state",{attrs:{"md-label":"No Contacts","md-description":"Add user before starting a conversation."}})],1)]),n("div",{staticClass:"contact-actions"},[n("md-button",{staticClass:"md-fab md-primary",on:{click:t.openAddContactDialog}},[n("md-icon",[t._v("add")])],1)],1)],1)},u=[],l=(n("ls82"),n("MECJ")),d=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"contact-item"},[n("div",{staticClass:"contact-item-bubble md-elevation-1",on:{click:function(e){e.preventDefault(),t.contactSwitch()}}},[n("md-avatar",{staticClass:"md-avatar-icon md-large"},[n("img",{attrs:{src:t.contact.avatar,alt:"Avatar"}})]),n("div",{staticClass:"contact-item-description"},[n("h3",[t._v(t._s(t.contact.username))])])],1)])},m=[],f=(n("xfY5"),{name:"ContactItem",methods:{contactSwitch:function(){this.$emit("on-click"),this.$eventBusEmit("contact-switch",this.contact)}},props:{index:Number,contact:Object}}),p=f,v=(n("Hx0h"),n("KHd+")),h=Object(v["a"])(p,d,m,!1,null,"2b564679",null),g=h.exports,w=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"add-contact-dialog"},[n("md-dialog",{attrs:{"md-active":t.showDialog},on:{"update:mdActive":function(e){t.showDialog=e}}},[n("md-dialog-title",[t._v("Add Contact")]),n("md-dialog-content",[n("md-field",[n("md-input",{attrs:{placeholder:"Search user..."},model:{value:t.searchValue,callback:function(e){t.searchValue=e},expression:"searchValue"}})],1),t._l(t.filteredContactList,function(e,a){return n("contact-item",{key:a,attrs:{contact:e},on:{"on-click":function(n){t.addToUserContact(e)}}})})],2),n("md-card-actions",[n("md-button",{staticClass:"md-primary",on:{click:function(e){t.onClose()}}},[t._v("Close")])],1)],1)],1)},b=[],_=(n("Oyvg"),{name:"AddContactDialog",data:function(){return{searchValue:"",contactList:[]}},mounted:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$apiCall({type:"get",url:"/users"});case 2:e=t.sent,e&&e instanceof Array&&(this.contactList=e);case 4:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),computed:{filteredContactList:function(){var t=this,e=this.user?this.user._id:"",n=new RegExp(this.searchValue,"g");return this.contactList.filter(function(a){return a._id!=e&&(""==t.searchValue||n.test(a.username))})}},methods:{addToUserContact:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(e){var n;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$apiCall({type:"post",url:"/user/".concat(this.user._id,"/add-contact"),data:{contact_id:e._id}});case 2:n=t.sent,this.onClose(),n&&(this.$emit("on-selected",e),this.$eventBusEmit("error",{title:"Success",message:"Contact added!"}));case 5:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}(),onClose:function(){this.$emit("close-dialog")}},watch:{},props:{user:Object,showDialog:Boolean},components:{ContactItem:g}}),C=_,y=(n("SwFd"),Object(v["a"])(C,w,b,!1,null,"def9bcd6",null)),$=y.exports,x={name:"Contacts",data:function(){return{contactList:[],loadingContacts:!1,showAddContact:!1}},mounted:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(){return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:this.user._id&&this.loadContacts();case 1:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),watch:{user:function(){this.loadContacts()}},methods:{onSelect:function(t){this.contactList.push(t)},loadContacts:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return this.loadingContacts=!0,t.next=3,this.$apiCall({type:"get",url:"/user/".concat(this.user._id,"/contacts")});case 3:e=t.sent,e&&(this.contactList=e,this.contactList.length>0?this.$eventBusEmit("contact-switch",this.contactList[0]):this.$eventBusEmit("update-input-visibility",!1)),this.loadingContacts=!1;case 6:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),openAddContactDialog:function(){this.showAddContact=!0}},props:{user:Object},components:{ContactItem:g,AddContactDialog:$}},D=x,k=(n("pguq"),Object(v["a"])(D,c,u,!1,null,"1ebd9851",null)),O=k.exports,j=function(){var t=this,e=t.$createElement,n=t._self._c||e;return t.visible?n("div",{attrs:{id:"input-container"}},[n("div",{attrs:{id:"input-text"}},[n("input",{directives:[{name:"model",rawName:"v-model",value:t.msg,expression:"msg"}],attrs:{type:"text",id:"input-text-box",name:"input-text-box",placeholder:"Type a message"},domProps:{value:t.msg},on:{keyup:function(e){if(!("button"in e)&&t._k(e.keyCode,"enter",13,e.key,"Enter"))return null;t.postMessage()},input:function(e){e.target.composing||(t.msg=e.target.value)}}})]),n("div",{attrs:{id:"input-button"}},[n("md-button",{on:{click:function(e){e.preventDefault(),t.postMessage()}}},[t._v("Send")])],1)]):t._e()},R=[],L=new a["default"],q={name:"Input",data:function(){return{currentContact:Object,visible:!0,msg:""}},mounted:function(){var t=this;L.$on("update-input-visibility",function(e){t.visible=e}),L.$on("contact-switch",function(e){t.currentContact=e})},methods:{postMessage:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:if(""!==this.msg){t.next=2;break}return t.abrupt("return");case 2:return t.next=4,this.$apiCall({type:"post",url:"user/".concat(this.user._id,"/conversation/").concat(this.currentContact._id,"/message"),data:{body:this.msg}});case 4:e=t.sent,e&&this.$eventBusEmit("post-message",{msg:this.msg,contact:this.currentContact}),this.msg="";case 7:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}()},props:{user:Object}},E=q,A=(n("Kdfm"),Object(v["a"])(E,j,R,!1,null,"11175e40",null)),P=A.exports,S=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"message-box"}},[n("div",{attrs:{id:"message-header"}},[n("h2",[t._v(t._s(t.username))])]),n("div",{attrs:{id:"messages"}},t._l(t.conversation,function(e,a){return n("div",{key:"msg-"+a},[e.sender_id==t.user._id?n("div",{staticClass:"message-own"},[n("md-avatar",{staticClass:"md-avatar-icon md-small accent"},[n("img",{attrs:{src:t.user.avatar,alt:"Avatar"}})]),n("div",{staticClass:"message-bubble"},[t._v("\n          "+t._s(e.body)+"\n        ")])],1):n("div",{staticClass:"message-response"},[n("md-avatar",{staticClass:"md-avatar-icon md-small accent"},[n("img",{attrs:{src:t.currentContact.avatar,alt:"Avatar"}})]),n("div",{staticClass:"message-bubble"},[t._v("\n          "+t._s(e.body)+"\n        ")])],1)])}))])},B=[],U={name:"MessageBox",props:{user:Object,currentContact:Object},data:function(){return{username:"",conversation:[]}},mounted:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(){var e,n=this;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:L.$on("contact-switch",function(t){n.username=t.username,n.currentContact=t,n.conversation=[],n.user._id&&n.loadContactConversation(t)}),L.$on("post-message",function(t){var e=t.msg,a=t.contact,r=new Date;n.conversation.unshift({created_at:r,body:e,sender_id:n.user._id}),n.addMessage(e,a)}),e=document.getElementById("messages"),e.scrollTop=e.scrollHeight;case 4:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),methods:{loadContactConversation:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(e){var n;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$apiCall({type:"get",url:"/user/".concat(this.user._id,"/conversation/").concat(e._id)});case 2:n=t.sent,n&&(this.conversation=n.reverse());case 4:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}(),addMessage:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(e,n){var a;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$apiCall({type:"post",url:"/user/".concat(this.user._id,"/conversation/").concat(n._id),data:{message:e}});case 2:a=t.sent,""!=a&&this.$eventBusEmit("error",{title:"Message",message:"Message could not be added"});case 4:case"end":return t.stop()}},t,this)}));return function(e,n){return t.apply(this,arguments)}}()}},V=U,F=(n("SspD"),Object(v["a"])(V,S,B,!1,null,"c835a72e",null)),M=F.exports,I={name:"Chat",components:{Contacts:O,InputBox:P,MessageBox:M},methods:{logout:function(){window.location.reload()}},computed:{description:function(){return this.user&&this.user.username?"Logged in as:"+this.user.username:"Not logged in"},userAvatar:function(){return this.user&&this.user.avatar?this.user.avatar:""}},props:{user:Object}},T=I,H=(n("kWOq"),Object(v["a"])(T,i,o,!1,null,"5bda595a",null)),J=H.exports,K=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("md-dialog",{attrs:{"md-click-outside-to-close":!1,"md-active":t.showDialog},on:{"update:mdActive":function(e){t.showDialog=e}}},[n("md-dialog-title",[t._v("Login Account")]),n("md-dialog-content",[n("form",{staticClass:"md-layout",attrs:{novalidate:""},on:{submit:function(e){return e.preventDefault(),t.validateUser(e)}}},[n("md-card-content",[n("md-field",{class:t.getValidationField("username")},[n("label",{attrs:{for:"username"}},[t._v("Username")]),n("md-input",{attrs:{name:"username",id:"username",disabled:t.sending},model:{value:t.form.username,callback:function(e){t.$set(t.form,"username",e)},expression:"form.username"}}),t.$v.form.username.required?t.$v.form.username.minlength?t._e():n("span",{staticClass:"md-error"},[t._v("Invalid username")]):n("span",{staticClass:"md-error"},[t._v("Username is required")])],1),n("md-field",{class:t.getValidationField("password")},[n("label",{attrs:{for:"email"}},[t._v("Password")]),n("md-input",{attrs:{type:"password",name:"password",id:"password",disabled:t.sending},model:{value:t.form.password,callback:function(e){t.$set(t.form,"password",e)},expression:"form.password"}}),t.$v.form.password.required?t.$v.form.password.minlength?t._e():n("span",{staticClass:"md-error"},[t._v("Invalid Password")]):n("span",{staticClass:"md-error"},[t._v("The email is required")])],1)],1),t.sending?n("md-progress-bar",{attrs:{"md-mode":"indeterminate"}}):t._e(),n("md-card-actions",[n("md-button",{staticClass:"md-primary",attrs:{type:"submit",disabled:t.sending}},[t._v("Login")]),n("md-button",{staticClass:"md-primary",on:{click:function(e){e.preventDefault(),t.register()}}},[t._v("Register")])],1),n("md-snackbar",{attrs:{"md-active":t.userSaved},on:{"update:mdActive":function(e){t.userSaved=e}}},[t._v("The user was saved with success!")])],1)])],1)],1)},z=[],N=n("Hc5T"),Y=n("ta7f"),Q={name:"LoginDialog",mixins:[N["validationMixin"]],data:function(){return{userSaved:!1,sending:!1,form:{username:"",password:""}}},props:{showDialog:Boolean},validations:{form:{username:{required:Y["required"],minLength:Object(Y["minLength"])(5)},password:{required:Y["required"],minLength:Object(Y["minLength"])(5)}}},methods:{register:function(){this.$emit("show-register-dialog")},getValidationField:function(t){var e=this.$v.form[t];if(e)return{"md-invalid":e.$invalid&&e.$dirty}},validateUser:function(){this.$v.$touch(),this.$v.$invalid||this.loginUser()},loginUser:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return this.sending=!0,t.next=3,this.$apiCall({type:"post",url:"/login",data:{username:this.form.username,password:this.form.password}});case 3:e=t.sent,e&&e._id&&this.$emit("login-user",e),this.sending=!1;case 6:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}()}},G=Q,W=(n("ztRS"),Object(v["a"])(G,K,z,!1,null,"5686dd2b",null)),Z=W.exports,X=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("md-dialog",{attrs:{"md-click-outside-to-close":!1,"md-active":t.showDialog},on:{"update:mdActive":function(e){t.showDialog=e}}},[n("md-dialog-title",[t._v("Register New Account")]),n("md-dialog-content",[n("form",{staticClass:"md-layout",attrs:{novalidate:""},on:{submit:function(e){return e.preventDefault(),t.validateUser(e)}}},[n("md-field",{class:t.getValidationField("username")},[n("label",{attrs:{for:"username"}},[t._v("Username")]),n("md-input",{attrs:{name:"username",id:"username",disabled:t.sending},model:{value:t.form.username,callback:function(e){t.$set(t.form,"username",e)},expression:"form.username"}}),t.$v.form.username.required?t.$v.form.username.minlength?t._e():n("span",{staticClass:"md-error"},[t._v("Invalid username")]):n("span",{staticClass:"md-error"},[t._v("Username is required")])],1),n("md-field",{class:t.getValidationField("email")},[n("label",{attrs:{for:"email"}},[t._v("Email")]),n("md-input",{attrs:{name:"email",id:"email",disabled:t.sending},model:{value:t.form.email,callback:function(e){t.$set(t.form,"email",e)},expression:"form.email"}}),t.$v.form.email.required?t.$v.form.email.minlength?t._e():n("span",{staticClass:"md-error"},[t._v("Invalid Email")]):n("span",{staticClass:"md-error"},[t._v("Email is required")])],1),n("md-field",{class:t.getValidationField("password")},[n("label",{attrs:{for:"email"}},[t._v("Password")]),n("md-input",{attrs:{type:"password",name:"password",id:"password",disabled:t.sending},model:{value:t.form.password,callback:function(e){t.$set(t.form,"password",e)},expression:"form.password"}}),t.$v.form.password.required?t.$v.form.password.minlength?t._e():n("span",{staticClass:"md-error"},[t._v("Invalid Password")]):n("span",{staticClass:"md-error"},[t._v("Password is required")])],1),n("md-field",{class:t.getValidationField("confirmPassword")},[n("label",{attrs:{for:"email"}},[t._v("Confirm Password")]),n("md-input",{attrs:{type:"password",name:"confirmPassword",id:"confirmPassword",disabled:t.sending},model:{value:t.form.confirmPassword,callback:function(e){t.$set(t.form,"confirmPassword",e)},expression:"form.confirmPassword"}}),t.$v.form.confirmPassword.required?t.$v.form.confirmPassword.minlength?t._e():n("span",{staticClass:"md-error"},[t._v("Invalid Password")]):n("span",{staticClass:"md-error"},[t._v("Confirm password is required")])],1),n("md-field",[n("label",{attrs:{for:"avatar"}},[t._v("Upload Avatar")]),n("md-file",{attrs:{accept:"image/*"},on:{change:t.convertAvatar},model:{value:t.form.avatar,callback:function(e){t.$set(t.form,"avatar",e)},expression:"form.avatar"}})],1),n("md-card-actions",[n("md-button",{staticClass:"md-primary",on:{click:function(e){e.preventDefault(),t.navigateback()}}},[t._v("Back")]),n("md-button",{staticClass:"md-primary",attrs:{type:"submit",disabled:t.sending}},[t._v("Register")])],1)],1)])],1)],1)},tt=[],et=(n("rGqo"),{name:"RegisterDialog",mixins:[N["validationMixin"]],data:function(){return{sending:!1,form:{username:"",email:"",password:"",confirmPassword:"",avatar:""}}},methods:{convertAvatar:function(t){var e=this,n=t.target;if(n.files&&n.files[0]){var a=new FileReader;a.onload=function(t){e.form.avatar=t.target.result},a.readAsDataURL(n.files[0])}},getValidationField:function(t){var e=this.$v.form[t];if(e)return{"md-invalid":e.$invalid&&e.$dirty}},validateUser:function(){this.$v.$touch(),this.$v.$invalid||this.registerUser()},registerUser:function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return this.sending=!0,t.next=3,this.$apiCall({type:"post",url:"/register",data:{username:this.form.username,email:this.form.email,password:this.form.password,avatar:this.form.avatar}});case 3:e=t.sent,e?(this.resetFields(),this.navigateback()):this.resetFields(["password","confirmPassword"]),this.sending=!1;case 6:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),resetFields:function(t){var e=this,n=t||["username","email","password","confirmPassword"];n.forEach(function(t){return e.form[t]=""})},navigateback:function(){this.$emit("close-dialog")}},validations:{form:{username:{required:Y["required"],minLength:Object(Y["minLength"])(5)},email:{required:Y["required"],email:Y["email"]},password:{required:Y["required"],minLength:Object(Y["minLength"])(5)},confirmPassword:{required:Y["required"],minLength:Object(Y["minLength"])(5)}}},props:{showDialog:Boolean}}),nt=et,at=(n("RjOz"),Object(v["a"])(nt,X,tt,!1,null,null,null)),rt=at.exports,st=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"error-message-dialog"},[n("md-dialog",{attrs:{"md-click-outside-to-close":!1,"md-active":t.showDialog},on:{"update:mdActive":function(e){t.showDialog=e}}},[n("md-dialog-title",[t._v(t._s(t.title))]),n("md-dialog-content",[t._v("\n      "+t._s(t.message)+"\n    ")]),n("md-card-actions",[n("md-button",{staticClass:"md-primary",on:{click:function(e){t.onClose()}}},[t._v("Close")])],1)],1)],1)},it=[],ot={name:"ErrorDialog",methods:{onClose:function(){this.$emit("close-dialog")}},props:{title:String,message:String,showDialog:Boolean}},ct=ot,ut=Object(v["a"])(ct,st,it,!1,null,null,null),lt=ut.exports,dt={name:"app",data:function(){return{showDialog:[!0,!1,!1],prevDialog:[],error:{title:null,message:null},user:{_id:null,username:null,avatar:null}}},computed:{},mounted:function(){var t=this;L.$on("error",function(e){var n=e.title,a=e.message;(n||a)&&(t.error.title=n,t.error.message=a,t.showError())})},methods:{loginUser:function(t){this.closeAll(),this.user=t},switchTo:function(t){var e=[!1,!1,!1];e[t]=!0,this.showDialog=e},resetError:function(){this.error.title=null,this.error.message=null,this.showDialog=this.prevDialog},showError:function(){this.prevDialog=this.showDialog,this.showDialog=[!1,!1,!0]},closeAll:function(){this.showDialog=[!1,!1,!1]}},components:{Chat:J,LoginDialog:Z,RegisterDialog:rt,ErrorDialog:lt}},mt=dt,ft=(n("ZL7j"),Object(v["a"])(mt,r,s,!1,null,null,null)),pt=ft.exports,vt=n("Q/mQ"),ht=n.n(vt),gt=n("vDqi"),wt=n.n(gt);a["default"].use({install:function(t){t.prototype.$apiCall=function(){var t=Object(l["a"])(regeneratorRuntime.mark(function t(e){var n,a,r,s,i,o,c;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return n=e.type,a=e.url,r=e.data,s="18.220.107.107:80","localhost:8081",i="http://".concat(s).concat(a),o="post"===n?[i,r]:[i],t.prev=5,t.next=8,wt.a[n].apply(wt.a,o);case 8:if(c=t.sent,!c.data.error){t.next=14;break}return L.$emit("error",{title:"Oups, error!",message:c.data.error}),t.abrupt("return",void 0);case 14:return t.abrupt("return",c.data);case 15:t.next=20;break;case 17:return t.prev=17,t.t0=t["catch"](5),t.abrupt("return",t.t0);case 20:case"end":return t.stop()}},t,this,[[5,17]])}));return function(e){return t.apply(this,arguments)}}(),t.prototype.$eventBusEmit=function(t,e){L.$emit(t,e)}}});n("44JG"),n("4JRs"),n("Ud79");n.d(e,"EventBus",function(){return bt});var bt=new a["default"];a["default"].use(ht.a),a["default"].config.productionTip=!1,new a["default"]({render:function(t){return t(pt)}}).$mount("#app")},YaQq:function(t,e,n){},ZL7j:function(t,e,n){"use strict";var a=n("slcd"),r=n.n(a);r.a},cbFo:function(t,e,n){},fiYB:function(t,e,n){},gl9u:function(t,e,n){},h4pn:function(t,e,n){},kWOq:function(t,e,n){"use strict";var a=n("h4pn"),r=n.n(a);r.a},pguq:function(t,e,n){"use strict";var a=n("fiYB"),r=n.n(a);r.a},sfI2:function(t,e,n){},slcd:function(t,e,n){},ztRS:function(t,e,n){"use strict";var a=n("D7Ho"),r=n.n(a);r.a}});
//# sourceMappingURL=app.6e16aeab.js.map