(window["webpackJsonpmanageusers-table-widget"]=window["webpackJsonpmanageusers-table-widget"]||[]).push([[0],{107:function(e,t,a){e.exports=a(126)},126:function(e,t,a){"use strict";a.r(t);var n=a(23),r=a(24),i=a(25),c=a(26),o=a(98),s=a(6),u=a(0),l=a.n(u),d=a(11),f=a.n(d),p=a(78),m=a.n(p),h=a(184),b=a(97),g=a(187),v=a(182),k=a(16),y=l.a.createContext(null),O=a(15),j=[5,10,25],E={currentPage:0,itemsPerPage:j[j.length-1]},w=l.a.createContext({pagination:E}),C=function(e){Object(i.a)(a,e);var t=Object(c.a)(a);function a(e){var r;Object(n.a)(this,a),r=t.call(this,e);var i="pagination"===e.paginationMode?j[1]:j[j.length-1];return r.state={pagination:Object(s.a)({},E,{itemsPerPage:i})},r.onChangeItemsPerPage=r.onChangeItemsPerPage.bind(Object(O.a)(r)),r.onChangeCurrentPage=r.onChangeCurrentPage.bind(Object(O.a)(r)),r}return Object(r.a)(a,[{key:"onChangeItemsPerPage",value:function(e){var t=e.target.value,a=parseInt(t,10);this.setState((function(e){return Object(s.a)({},e,{pagination:Object(s.a)({},e.pagination,{itemsPerPage:a,currentPage:0})})}))}},{key:"onChangeCurrentPage",value:function(e){var t=parseInt(e,10);this.setState((function(e){return Object(s.a)({},e,{pagination:Object(s.a)({},e.pagination,{currentPage:t})})}))}},{key:"render",value:function(){var e=this.state.pagination,t=this.props.children;return l.a.createElement(w.Provider,{value:Object(s.a)({},e,{onChangeCurrentPage:this.onChangeCurrentPage,onChangeItemsPerPage:this.onChangeItemsPerPage})},t)}}]),a}(l.a.Component);C.defaultProps={paginationMode:""};var P=a(7),x=a.n(P),R=a(19),N=a(14),A=a(33),S=a(174),F=a(95),U=a.n(F),I=a(4),D=a(5),M=a.n(D),T=(M.a.shape({initialized:M.a.bool,authenticated:M.a.bool}),a(63));M.a.oneOfType([M.a.func,M.a.shape({current:M.a.elementType}),M.a.shape(null)]);var L=function(e){var t=e.children,a=e.keycloak;return a.initialized&&a.authenticated?t:null},z=function(e){var t=e.children,a=e.keycloak;return a.initialized&&a.authenticated?null:t},W=a(173),H=a(186),J=a(172),q=a(170),G=a(171),K=a(169),_=function(e){Object(i.a)(a,e);var t=Object(c.a)(a);function a(e){var r;return Object(n.a)(this,a),(r=t.call(this,e)).state={open:!1},r.handleOpen=r.handleOpen.bind(Object(O.a)(r)),r.discard=r.discard.bind(Object(O.a)(r)),r.confirm=r.confirm.bind(Object(O.a)(r)),r}return Object(r.a)(a,[{key:"handleOpen",value:function(){this.setState((function(){return{open:!0}}))}},{key:"handleClose",value:function(e){var t=this.props.onCloseDialog;this.setState((function(){return{open:!1}})),t(e)}},{key:"discard",value:function(){this.handleClose(a.DISCARD)}},{key:"confirm",value:function(){this.handleClose(a.CONFIRM)}},{key:"render",value:function(){var e=this.state.open,t=this.props,a=t.dialog,n=a.title,r=a.description,i=a.confirmLabel,c=a.discardLabel,o=t.Renderer;return l.a.createElement("div",{style:{display:"inline-block"}},l.a.createElement(o,{onClick:this.handleOpen}),l.a.createElement(H.a,{open:e,onClose:this.handleClose,"aria-labelledby":"confirmation-dialog-title","aria-describedby":"confirmation-dialog-description"},l.a.createElement(K.a,{id:"confirmation-dialog-title"},n),l.a.createElement(q.a,null,l.a.createElement(G.a,{id:"confirmation-dialog-description"},r)),l.a.createElement(J.a,null,l.a.createElement(W.a,{onClick:this.discard,autoFocus:!0},c),l.a.createElement(W.a,{onClick:this.confirm,color:"primary"},i))))}}]),a}(u.PureComponent);_.CONFIRM="CONFIRM",_.DISCARD="DISCARD";var B=a(86),V=a(183);function X(e){var t=function(t){Object(i.a)(o,t);var a=Object(c.a)(o);function o(){var t;Object(n.a)(this,o);for(var r=arguments.length,i=new Array(r),c=0;c<r;c++)i[c]=arguments[c];return(t=a.call.apply(a,[this].concat(i))).renderWrappedComponent=function(a){var n=t.props,r=n.forwardedRef,i=Object(T.a)(n,["forwardedRef"]);return l.a.createElement(e,Object.assign({},i,{ref:r,pagination:a}))},t}return Object(r.a)(o,[{key:"render",value:function(){return l.a.createElement(w.Consumer,null,this.renderWrappedComponent)}}]),o}(u.Component);return t.defaultProps={forwardedRef:null},Object(u.forwardRef)((function(e,a){return l.a.createElement(t,Object.assign({},e,{forwardedRef:a}))}))}var Y=a(87),Q=a.n(Y),Z=a(88),$=a.n(Z),ee=a(89),te=a.n(ee),ae=a(90),ne=a.n(ae),re=Object(A.b)()(Object(I.a)({root:{flexShrink:0,marginLeft:"5px"}})((function(e){var t=e.classes,a=e.count,n=e.page,r=e.rowsPerPage,i=e.onChangePage,c=e.t;return l.a.createElement("div",{className:t.root},l.a.createElement(S.a,{onClick:function(){i(0)},disabled:0===n,"aria-label":c("pagination.ariaLabels.firstPage")},l.a.createElement(Q.a,null)),l.a.createElement(S.a,{onClick:function(){i(n-1)},disabled:0===n,"aria-label":c("pagination.ariaLabels.previousPage")},l.a.createElement($.a,null)),l.a.createElement(S.a,{onClick:function(){i(n+1)},disabled:n>=Math.ceil(a/r)-1,"aria-label":c("pagination.ariaLabels.nextPage")},l.a.createElement(te.a,null)),l.a.createElement(S.a,{onClick:function(){i(Math.max(0,Math.ceil(a/r)-1))},disabled:n>=Math.ceil(a/r)-1,"aria-label":c("pagination.ariaLabels.lastPage")},l.a.createElement(ne.a,null)))}))),ie=(M.a.shape({id:M.a.string,username:M.a.string}),Object(A.b)()(X((function(e){var t=e.children,a=e.pagination,n=e.paginationMode,r=e.items,i=e.count,c=e.t;return"infinite-scroll"===n?l.a.createElement(B.a,{dataLength:r.length,next:function(){return a.onChangeCurrentPage(a.currentPage+1)},hasMore:r.length<i,loader:l.a.createElement("div",null,c("common.loadingMore"))},t):"pagination"===n?l.a.createElement(l.a.Fragment,null,t,i>0&&l.a.createElement(V.a,{component:"div",rowsPerPageOptions:j,count:i,rowsPerPage:a.itemsPerPage,page:a.currentPage,SelectProps:{native:!0},onChangePage:a.onChangeCurrentPage,onChangeRowsPerPage:a.onChangeItemsPerPage,ActionsComponent:re})):t})))),ce=a(178),oe=a(179),se=a(180),ue=a(175),le=a(177),de=Object(I.a)((function(){return{body:{fontSize:14,borderRadius:0,fontFamily:"Cabin-Regular",padding:"0 2rem"}}}))(ue.a),fe=Object(I.a)((function(e){return{root:{"&:nth-of-type(odd)":{backgroundColor:e.palette.background.default}}}}))(le.a),pe=function(e){var t=e.items,a=e.onSelect,n=e.classes,r=e.t,i=e.Actions,c=t.map((function(e,t){return l.a.createElement(fe,{hover:!0,className:n.rowRoot,key:t,onClick:function(){return a(e)}},l.a.createElement(de,null,l.a.createElement("span",null,e.username)),l.a.createElement(de,null,l.a.createElement("span",null,e.firstName)),l.a.createElement(de,null,l.a.createElement("span",null,e.lastName)),l.a.createElement(de,null,l.a.createElement("span",null,e.email)),i&&l.a.createElement(de,null,l.a.createElement(i,{item:e})))}));return t.length?l.a.createElement(ce.a,{className:n.Table__notification,stickyHeader:!0},l.a.createElement(oe.a,null,l.a.createElement(le.a,null,l.a.createElement(de,null,l.a.createElement("span",null,r("entities.manageusers.username"))),l.a.createElement(de,null,l.a.createElement("span",null,r("entities.manageusers.firstName"))),l.a.createElement(de,null,l.a.createElement("span",null,r("entities.manageusers.lastName"))),l.a.createElement(de,null,l.a.createElement("span",null,r("entities.manageusers.email"))),i&&l.a.createElement(de,null,l.a.createElement("span",null,r("common.reset"))))),l.a.createElement(se.a,null,c)):l.a.createElement("div",{className:n.noItems},r("entities.manageusers.noItems"))};pe.defaultProps={onSelect:function(){},Actions:null};var me=Object(I.a)({tableRoot:{marginTop:"10px"},rowRoot:{cursor:"pointer",overflow:"hidden",textOverflow:"ellipsis",whiteSpace:"nowrap"},noItems:{margin:"15px",textAlign:"center",color:"#15840C"},Table__notification:{display:"inline-table",fontFamily:"Cabin-Regular","& thead":{background:"#D6E291",fontFamily:"Cabin-Regular","& tr":{textAlign:"center",height:"50px"},"& th":{fontSize:"18px",lineHeight:"22px",color:"#15840C",paddingRight:"0",textTransform:"uppercase"}},"& tr":{textAlign:"center"}}})(Object(A.b)()(pe)),he=a(3),be=a(188),ge=a(181),ve=a(64),ke=a(92),ye=a.n(ke),Oe=a(93),je=a.n(Oe),Ee=a(91),we=a.n(Ee),Ce=a(94),Pe=a.n(Ce),xe={success:we.a,error:ye.a,info:je.a},Re={success:3e3,error:null,info:5e3},Ne=function e(t){var a=t.className,n=t.classes,r=t.status,i=t.message,c=t.onClose,o=!!i,s=r||e.INFO,u=xe[s],d=Re[s],f=l.a.createElement("span",{className:n.message},l.a.createElement(u,{className:Object(he.a)(n.icon,n.iconStatus)}),i);return l.a.createElement(be.a,{open:o,onClose:c,autoHideDuration:d},l.a.createElement(ge.a,{className:Object(he.a)(n[s],a),message:f,action:[l.a.createElement(S.a,{key:"close","aria-label":"close",color:"inherit",onClick:c},l.a.createElement(Pe.a,{className:n.icon}))]}))};Ne.SUCCESS="success",Ne.ERROR="error",Ne.INFO="info",Ne.defaultProps={message:null,status:null,className:"",onClose:function(){}};var Ae=Object(I.a)((function(e){return{message:{display:"flex",alignItems:"center"},icon:{fontSize:20},iconStatus:{opacity:.9,marginRight:e.spacing(1)},success:{backgroundColor:ve.a[600]},error:{backgroundColor:e.palette.error.dark},info:{backgroundColor:e.palette.primary.main}}}),{withTheme:!0})(Ne),Se=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:[];return e.length?e.filter((function(e){return e.field&&e.operator})).reduce((function(e,t){switch(t.operator){case"specified":return[].concat(Object(R.a)(e),["".concat(encodeURIComponent("".concat(t.field,".specified")),"=true")]);case"unspecified":return[].concat(Object(R.a)(e),["".concat(encodeURIComponent("".concat(t.field,".specified")),"=false")])}return[].concat(Object(R.a)(e),["".concat(encodeURIComponent("".concat(t.field,".").concat(t.operator)),"=").concat(encodeURIComponent(t.value))])}),[]).join("&"):""},Fe=function(){return{headers:new Headers({Authorization:"Bearer ".concat(window&&window.entando&&window.entando.keycloak&&window.entando.keycloak.authenticated?window.entando.keycloak.token:""),"Content-Type":"application/json"})}},Ue=function(){return{headers:new Headers({"Content-Type":"application/json"})}},Ie=function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:"",a=arguments.length>2&&void 0!==arguments[2]?arguments[2]:"",n=!(!t&&!a),r="".concat(t).concat(t?"&":"").concat(a);return"".concat(e).concat(n?"?".concat(r):"")},De=function(){var e=Object(N.a)(x.a.mark((function e(t,a){var n;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,fetch(t,a);case 2:if(204!==(n=e.sent).status){e.next=5;break}return e.abrupt("return","");case 5:if(404!==n.status){e.next=7;break}return e.abrupt("return",null);case 7:if(!(n.status>=200&&n.status<300)){e.next=13;break}return e.next=10,n.json();case 10:e.t0=e.sent,e.next=14;break;case 13:e.t0=Promise.reject(new Error(n.statusText||n.status));case 14:return e.abrupt("return",e.t0);case 15:case"end":return e.stop()}}),e)})));return function(t,a){return e.apply(this,arguments)}}(),Me=function(){var e=Object(N.a)(x.a.mark((function e(t,a){var n,r,i,c,o,u,l,d;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return n=a.filters,r=void 0===n?[]:n,i=a.pagination,c=a.mode,o=Se(r),u=i?"page=".concat(i.page,"&size=").concat(i.rowsPerPage):"",l=Ie("".concat(t,"/").concat("manageusers").concat("count"===c?"/count":""),o,u),d=Object(s.a)({},Fe(),{method:"GET"}),e.abrupt("return",De(l,d));case 6:case"end":return e.stop()}}),e)})));return function(t,a){return e.apply(this,arguments)}}(),Te=function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.serviceUrl,n=t.userid,r=t.account,i="savings"===r?"".concat(a,"/").concat(r,"/api/").concat(r,"?userID.equals=").concat(n):"".concat(a,"/").concat(r,"/api/").concat(r,"s/user/").concat(n),c=Object(s.a)({},Fe(),{method:"GET"}),e.abrupt("return",De(i,c));case 4:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}(),Le=function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.serviceUrl,n=t.account,r=t.accountObj,i="checking"===n?"".concat(a,"/").concat(n,"/add"):"".concat(a,"/").concat(n,"/api"),i="savings"===n?"".concat(i,"/").concat(n):"".concat(i,"/").concat(n,"s"),c=Object(s.a)({},"checking"===n?Ue():Fe(),{method:"POST",body:r?JSON.stringify(r):null}),e.abrupt("return",De(i,c));case 5:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}(),ze=function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.serviceUrl,n=t.accountid,r=t.account,i="".concat(a,"/").concat(r,"transaction/api/").concat(r,"transactions?accountID.equals=").concat(n),c=Object(s.a)({},Fe(),{method:"GET"}),e.abrupt("return",De(i,c));case 4:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}(),We=function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.serviceUrl,n=t.account,r=t.transaction,i="".concat(a,"/").concat(n,"transaction/api/").concat(n,"transactions"),c=Object(s.a)({},Fe(),{method:"POST",body:r?JSON.stringify(r):null}),e.abrupt("return",De(i,c));case 4:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}(),He=function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.serviceUrl,n=t.userid,r=t.notificationName,i="".concat(a,"/seedsdashboard/api/").concat(r,"s?userId.equals=").concat(n),c=Object(s.a)({},Fe(),{method:"GET"}),e.abrupt("return",De(i,c));case 4:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}(),Je=function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.serviceUrl,n=t.notificationName,r=t.notificationObj,i="".concat(a,"/seedsdashboard/api/").concat(n,"s"),c=Object(s.a)({},Ue(),{method:"POST",body:r?JSON.stringify(r):null}),e.abrupt("return",De(i,c));case 4:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}(),qe=function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.serviceUrl,n=t.notificationName,r=t.notificationObj,i="".concat(a,"/seedsdashboard/api/").concat(n,"s"),c=Object(s.a)({},Fe(),{method:"PUT",body:r?JSON.stringify(r):null}),e.abrupt("return",De(i,c));case 4:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}(),Ge={formUpdate:"manageusers.form.update",formCreate:"manageusers.form.create",formDelete:"manageusers.form.delete"},Ke="manageusers.table.select",_e="manageusers.table.add",Be="manageusers.table.error",Ve="manageusers.table.reset",Xe="manageusers-filter/addFilter",Ye="manageusers-filter/updateFilter",Qe="manageusers-filter/deleteFilter",Ze="manageusers-filter/clearFilters",$e="manageusers-table/readAll",et="manageusers-table/error",tt="manageusers-table/clearErrors",at="manageusers-table/clearItems",nt="manageusers-table/create",rt="manageusers-table/update",it="manageusers-table/delete",ct="manageusers-table/reset",ot={filters:[],items:[],count:0,notificationMessage:null,notificationStatus:null,loading:!1},st=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:ot,t=arguments.length>1?arguments[1]:void 0;switch(t.type){case Xe:return Object(s.a)({},e,{filters:[].concat(Object(R.a)(e.filters),[{field:"",operator:"",value:""}])});case Ye:return Object(s.a)({},e,{filters:e.filters.map((function(e,a){return a===t.payload.filterId?Object(s.a)({},e,{},t.payload.values):e}))});case Qe:return Object(s.a)({},e,{items:ot.items,count:ot.count,filters:e.filters.filter((function(e,a){return a!==t.payload.filterId}))});case Ze:return Object(s.a)({},e,{items:ot.items,count:ot.count,filters:ot.filters});case at:return Object(s.a)({},e,{items:ot.items,count:ot.count});case $e:return Object(s.a)({},e,{items:t.payload.items,count:t.payload.count});case et:return Object(s.a)({},e,{notificationMessage:t.payload.message,notificationStatus:t.payload.status});case tt:return Object(s.a)({},e,{notificationMessage:null});case nt:case Ge.formCreate:return Object(s.a)({},e,{items:[].concat(Object(R.a)(e.items),[t.payload])});case rt:case Ge.formUpdate:var a=e.items.findIndex((function(e){return e.id===t.payload.id})),n=Object(R.a)(e.items);return n[a]=t.payload,Object(s.a)({},e,{items:n});case it:case Ge.formDelete:return Object(s.a)({},e,{items:e.items.filter((function(e){return e.id!==t.payload.id}))});case ct:default:return e}},ut=function(){for(var e="";12!==e.length;)e="".concat(Math.floor(1e5+9e12*Math.random()));return e},lt=function(e){return e[Math.floor(Math.random()*e.length)]},dt=function(e){var t=new Date;return t.setDate(t.getDate()-e),t.toISOString().substring(0,10)},ft=function(e,t){return t-e},pt=function(e){for(var t=e.b,a=e.accountID,n=1,r=t,i=["Cake mix expense","Chocolate covered crickets","antenna tower","Greetings from the galaxy","toasted cheese and tuna sandwiches","research paper on Friday","road work ahead","Interest expense","Telephone expense","Repairs","Oven","Computer","Car ensurance","First transaction","Second transaction","Third transaction"],c=["3.50","23.72","413.95","58.50","24.39","60.63","48.84","28.79","49.98","94.77","71.79","37.75","9.25","19.17","32.98","41.38"],o=[],s=n;s<17;s++){var u=lt(c);s>1&&(r=ft(u,r));var l={date:dt(n),description:lt(i),amount:u,balance:r,accountID:a};o.push(l),n++}return o},mt=function(e){var t=e.description,a=e.id;return{description:t,createdAt:(new Date).toISOString().substring(0,10),read:!1,userId:a}},ht=function(e){var t=e.userId;return[mt({description:"Welcome in your bank",id:t}),mt({description:"Checking account created",id:t}),mt({description:"Internet banking ACTIVE",id:t}),mt({description:"Info banking",id:t})]},bt=function(e){Object(i.a)(a,e);var t=Object(c.a)(a);function a(e){var r;return Object(n.a)(this,a),(r=t.call(this,e)).state=Object(s.a)({},ot,{hasAccess:!0}),r.handleReset=r.handleReset.bind(Object(O.a)(r)),r.handleError=r.handleError.bind(Object(O.a)(r)),r.closeNotification=r.closeNotification.bind(Object(O.a)(r)),r.fetchData=r.fetchData.bind(Object(O.a)(r)),r.updateFilter=r.updateFilter.bind(Object(O.a)(r)),r.addFilter=r.addFilter.bind(Object(O.a)(r)),r.removeFilter=r.removeFilter.bind(Object(O.a)(r)),r.clearFilters=r.clearFilters.bind(Object(O.a)(r)),r.applyFilters=r.applyFilters.bind(Object(O.a)(r)),r.handleResetAccountAndTransactions=r.handleResetAccountAndTransactions.bind(Object(O.a)(r)),r}return Object(r.a)(a,[{key:"componentDidMount",value:function(){var e=this.props.keycloak;e.initialized&&e.authenticated&&this.fetchUsers()}},{key:"componentDidUpdate",value:function(e){var t=this.props,a=t.keycloak,n=t.paginationMode,r=t.pagination,i=a.initialized&&a.authenticated,c=e.keycloak.authenticated!==i,o=["pagination","infinite-scroll"].includes(n)&&(e.pagination.currentPage!==r.currentPage||e.pagination.itemsPerPage!==r.itemsPerPage);i&&(c||o)&&this.fetchUsers()}},{key:"dispatch",value:function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:function(){};this.setState((function(t){return st(t,e)}),t)}},{key:"fetchData",value:function(){var e=Object(N.a)(x.a.mark((function e(){var t,a,n,r,i,c,o,u,l,d,f,p,m;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(t=this.state,a=t.filters,n=t.items,r=this.props,i=r.keycloak,c=r.paginationMode,o=r.pagination,u=r.serviceUrl,!(i.initialized&&i.authenticated)){e.next=18;break}return e.prev=4,l=Object(s.a)({filters:a},""===c?{}:{pagination:{page:o.currentPage,rowsPerPage:o.itemsPerPage}}),e.next=8,Me(u,l);case 8:d=e.sent,f=d.manageusers,p=d.headers,m=p&&p["X-Total-Count"]||null,this.dispatch({type:$e,payload:{items:"infinite-scroll"===c?[].concat(Object(R.a)(n),Object(R.a)(f)):f,count:m}}),e.next=18;break;case 15:e.prev=15,e.t0=e.catch(4),this.handleError(e.t0);case 18:case"end":return e.stop()}}),e,this,[[4,15]])})));return function(){return e.apply(this,arguments)}}()},{key:"fetchUsers",value:function(){var e=Object(N.a)(x.a.mark((function e(){var t,a,n,r,i,c,o,s,u=this;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:t=this.props,a=t.keycloak,n=t.paginationMode,r=t.pagination,i=t.keycloakUrl,c=t.realm,t.t,o=this.state.items,s=!0,fetch("".concat(i,"/auth/admin/realms/").concat(c,"/users?first=").concat(r.currentPage*r.itemsPerPage,"&max=").concat(r.itemsPerPage),{headers:{Authorization:"Bearer ".concat(a.token)}}).then((function(e){return 401!==e.status&&403!==e.status||(s=!1),e.json()})).then((function(e){s?fetch("".concat(i,"/auth/admin/realms/").concat(c,"/users"),{headers:{Authorization:"Bearer ".concat(a.token)}}).then((function(e){return e.json()})).then((function(t){u.dispatch({type:$e,payload:{items:"infinite-scroll"===n?[].concat(Object(R.a)(o),Object(R.a)(e)):e,count:t.length}})})):u.setState({hasAccess:s})})).catch((function(e){return u.handleError(e)}));case 4:case"end":return e.stop()}}),e,this)})));return function(){return e.apply(this,arguments)}}()},{key:"updateFilter",value:function(e,t){this.dispatch({type:Ye,payload:{values:t,filterId:e}})}},{key:"addFilter",value:function(){this.dispatch({type:Xe})}},{key:"removeFilter",value:function(e){this.dispatch({type:Qe,payload:{filterId:e}},this.fetchData)}},{key:"clearFilters",value:function(){this.dispatch({type:Ze},this.fetchData)}},{key:"applyFilters",value:function(){this.dispatch({type:at},this.fetchData)}},{key:"closeNotification",value:function(){this.dispatch({type:tt})}},{key:"handleError",value:function(e){var t=this.props,a=t.onError,n=t.t;a(e),this.dispatch({type:et,payload:{notificationMessage:n("error.dataLoading"),notificationStatus:Ae.ERROR}})}},{key:"handleResetAccountAndTransactions",value:function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c,o,s;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.accountName,n=t.serviceUrl,r=t.item,e.next=3,Te({serviceUrl:n,userid:r.id,account:a});case 3:if((i=e.sent)&&i.length&&i.length>0&&(i=i[0]),i&&!(i&&i.length<1)){e.next=10;break}return c={accountNumber:ut(),balance:3500,userID:r.id},e.next=9,Le({serviceUrl:n,account:a,accountObj:c});case 9:i=e.sent;case 10:return e.next=12,ze({serviceUrl:n,accountid:i.id,account:a});case 12:(!(o=e.sent)||o&&o<1)&&(s=pt({b:3500,accountID:i.id}),o=s.map(function(){var e=Object(N.a)(x.a.mark((function e(t){return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,We({serviceUrl:n,account:a,transaction:t});case 2:return e.abrupt("return",e.sent);case 3:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}()));case 14:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}()},{key:"handleResetNotifications",value:function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c,o;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return a=t.notificationName,n=t.serviceUrl,r=t.item,e.next=3,He({serviceUrl:n,userid:r.id,notificationName:a});case 3:if((i=e.sent)&&!(i&&i.length<1)){e.next=15;break}if("alert"!==a){e.next=10;break}c=ht({userId:r.id}),i=c.map(function(){var e=Object(N.a)(x.a.mark((function e(t){return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,Je({serviceUrl:n,notificationName:a,notificationObj:t});case 2:return e.abrupt("return",e.sent);case 3:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}()),e.next=13;break;case 10:return o=mt({description:"First Statement",id:r.id}),e.next=13,Je({serviceUrl:n,notificationName:a,notificationObj:o});case 13:e.next=16;break;case 15:i.map(function(){var e=Object(N.a)(x.a.mark((function e(t){var r;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return(r=Object(s.a)({},t)).read=!1,e.next=4,qe({serviceUrl:n,notificationName:a,notificationObj:r});case 4:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}());case 16:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}()},{key:"handleReset",value:function(){var e=Object(N.a)(x.a.mark((function e(t){var a,n,r,i,c,o,s,u,l;return x.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(a=this.props,n=a.t,r=a.onReset,i=a.keycloak,c=a.serviceUrl,!(i.initialized&&i.authenticated)){e.next=28;break}return e.prev=3,"checking",o="savings",s="creditcard",u="alert",l="statement",e.next=11,this.handleResetAccountAndTransactions({accountName:"checking",serviceUrl:c,item:t});case 11:return e.next=13,this.handleResetAccountAndTransactions({accountName:o,serviceUrl:c,item:t});case 13:return e.next=15,this.handleResetAccountAndTransactions({accountName:s,serviceUrl:c,item:t});case 15:return e.next=17,this.handleResetNotifications({notificationName:u,serviceUrl:c,item:t});case 17:return e.next=19,this.handleResetNotifications({notificationName:l,serviceUrl:c,item:t});case 19:r(t),this.dispatch({type:ct,payload:{id:t.id}}),this.setState({notificationMessage:n("common.dataResetted"),notificationStatus:Ae.SUCCESS}),e.next=28;break;case 24:e.prev=24,e.t0=e.catch(3),this.handleError(e.t0),this.setState({notificationMessage:n("common.couldNotFetchData"),notificationStatus:Ae.ERROR});case 28:case"end":return e.stop()}}),e,this,[[3,24]])})));return function(t){return e.apply(this,arguments)}}()},{key:"handleConfirmationDialogAction",value:function(e,t){switch(e){case _.CONFIRM:this.handleReset(t)}}},{key:"render",value:function(){var e=this,t=this.state,a=t.items,n=t.count,r=t.notificationMessage,i=t.notificationStatus,c=t.hasAccess,o=this.props,s=o.classes,u=o.onSelect,d=o.onReset,f=o.t,p=o.keycloak,m=o.paginationMode,h=void 0===m?"":m,b=f("common.reset");return console.log(f("error.noAccess")),l.a.createElement(l.a.Fragment,null,c?l.a.createElement(l.a.Fragment,null,l.a.createElement(z,{keycloak:p},f("common.notAuthenticated")),l.a.createElement(L,{keycloak:p},l.a.createElement(ie,{items:a,paginationMode:h,count:n},l.a.createElement("div",{className:s.tableWrapper},l.a.createElement(me,{items:a,onSelect:u,Actions:function(t){var a=t.item;return d?l.a.createElement(_,{onCloseDialog:function(t){return e.handleConfirmationDialogAction(t,a)},dialog:{title:f("entities.manageusers.resetDialog.title"),description:f("entities.manageusers.resetDialog.description"),confirmLabel:f("common.yes"),discardLabel:f("common.no")},Renderer:function(e){var t=e.onClick;return l.a.createElement(S.a,{"aria-label":b,title:b,onClick:t},l.a.createElement(U.a,null))}}):""}}))))):l.a.createElement("div",null,f("error.noAccess")),l.a.createElement(Ae,{status:i,message:r,onClose:this.closeNotification}))}}]),a}(u.Component);bt.defaultProps={onReset:function(){},onError:function(){},onSelect:function(){},paginationMode:"",pagination:null,serviceUrl:"",keycloakUrl:"",realm:""};var gt=function(e){var t=function(t){Object(i.a)(o,t);var a=Object(c.a)(o);function o(){var t;Object(n.a)(this,o);for(var r=arguments.length,i=new Array(r),c=0;c<r;c++)i[c]=arguments[c];return(t=a.call.apply(a,[this].concat(i))).renderWrappedComponent=function(a){var n=t.props,r=n.forwardedRef,i=Object(T.a)(n,["forwardedRef"]);return l.a.createElement(e,Object.assign({},i,{ref:r,keycloak:a}))},t}return Object(r.a)(o,[{key:"render",value:function(){return l.a.createElement(y.Consumer,null,this.renderWrappedComponent)}}]),o}(u.Component);return t.defaultProps={forwardedRef:function(){}},Object(u.forwardRef)((function(e,a){return l.a.createElement(t,Object.assign({},e,{forwardedRef:a}))}))}(Object(I.a)({fab:{float:"right"},tableWrapper:{width:"100%",overflowX:"auto",overflowY:"hidden",marginTop:"80px"}})(Object(A.b)(void 0,{withRef:!0})(X(bt)))),vt=a(49),kt=a(69),yt={en:a(96)},Ot=Object.keys(yt).reduce((function(e,t){return Object(s.a)({},e,Object(vt.a)({},t,Object(vt.a)({},"translation",yt[t])))}),{}),jt=(kt.a.t,function(e){!function(e,t){kt.a.use(A.a).init({defaultNs:"translation",interpolation:{escapeValue:!1},resources:Ot,lng:e||t,fallbackLng:t,react:{useSuspense:!1}})}(e,"en")}),Et=function(e){return function(t){return function(e,t){var a=new CustomEvent(e,{detail:{payload:t}});window.dispatchEvent(a)}(e,t)}},wt=function(){return window&&window.entando&&window.entando.keycloak&&Object(s.a)({},window.entando.keycloak,{initialized:!0})||{initialized:!1}},Ct={hidden:"hidden",locale:"locale",paginationMode:"pagination-mode",disableDefaultEventHandler:"disable-default-event-handler",serviceUrl:"service-url",keycloakUrl:"keycloak-url",realm:"realm"},Pt=function(e){Object(i.a)(a,e);var t=Object(c.a)(a);function a(){var e;Object(n.a)(this,a);for(var r=arguments.length,i=new Array(r),c=0;c<r;c++)i[c]=arguments[c];return(e=t.call.apply(t,[this].concat(i))).keycloak=wt(),e.onAdd=Et(_e),e.onError=Et(Be),e.onSelect=Et(Ke),e.onReset=Et(Ve),e.reactRootRef=l.a.createRef(),e}return Object(r.a)(a,[{key:"attributeChangedCallback",value:function(e,t,a){if(this.container&&t!==a){if(!Object.values(Ct).includes(e))throw new Error("Untracked changed attribute: ".concat(e));this.render()}}},{key:"connectedCallback",value:function(){var e=this;this.container=document.createElement("div"),this.mountPoint=document.createElement("div"),this.container.appendChild(this.mountPoint);var t,a,n=this.attachShadow({mode:"open"});n.appendChild(this.container),this.jss=Object(k.b)(Object(s.a)({},Object(h.a)(),{insertionPoint:this.container})),this.muiTheme=Object(b.a)({props:{MuiDialog:{container:this.mountPoint}}}),this.keycloak=Object(s.a)({},wt(),{initialized:!0}),this.unsubscribeFromKeycloakEvent=(t="keycloak",a=function(){e.keycloak=Object(s.a)({},wt(),{initialized:!0}),e.render()},window.addEventListener(t,a),function(){window.removeEventListener(t,a)}),this.render(),m()(n)}},{key:"disconnectedCallback",value:function(){this.unsubscribeFromWidgetEvents&&this.unsubscribeFromWidgetEvents(),this.unsubscribeFromKeycloakEvent&&this.unsubscribeFromKeycloakEvent()}},{key:"defaultWidgetEventHandler",value:function(){var e=this;return function(t){var a=function(e){var t=e.type,a=e.detail;return{type:t,payload:a.payload,error:a.error,meta:a.meta}}(t);e.reactRootRef.current.dispatch(a)}}},{key:"render",value:function(){if(!("true"===this.getAttribute(Ct.hidden))){var e=this.getAttribute(Ct.locale);jt(e);var t,a,n=this.getAttribute(Ct.paginationMode)||"",r=this.getAttribute(Ct.serviceUrl)||"",i=this.getAttribute(Ct.keycloakUrl)||"",c=this.getAttribute(Ct.realm)||"";if("true"===this.getAttribute(Ct.disableDefaultEventHandler))this.unsubscribeFromWidgetEvents&&this.unsubscribeFromWidgetEvents(),this.unsubscribeFromKeycloakEvent&&this.unsubscribeFromKeycloakEvent();else{var o=this.defaultWidgetEventHandler();this.unsubscribeFromWidgetEvents=(t=Object.values(Ge),a=o,t.forEach((function(e){return window.addEventListener(e,a)})),function(){t.forEach((function(e){return window.removeEventListener(e,a)}))})}f.a.render(l.a.createElement(y.Provider,{value:this.keycloak},l.a.createElement(g.b,{jss:this.jss},l.a.createElement(v.a,{theme:this.muiTheme},l.a.createElement(C,{paginationMode:n},l.a.createElement(gt,{ref:this.reactRootRef,onAdd:this.onAdd,onReset:this.onReset,onSelect:this.onSelect,onError:this.onError,paginationMode:n,serviceUrl:r,keycloakUrl:i,realm:c}))))),this.mountPoint)}}}],[{key:"observedAttributes",get:function(){return Object.values(Ct)}}]),a}(Object(o.a)(HTMLElement));customElements.define("manageusers-table",Pt)},96:function(e){e.exports=JSON.parse('{"error":{"dataLoading":"Error during server connection","noAccess":"User is not authorized to manage users"},"common":{"couldNotFetchData":"Unfortunately we could not fetch entity data","notAuthenticated":"User is not authenticated.","loadingMore":"Loading more...","download":"Download file","dataDeleted":"Manageusers successfully deleted","dataResetted":"Data successfully resetted","yes":"Yes","no":"No","reset":"Reset"},"pagination":{"ariaLabels":{"firstPage":"first page","previousPage":"previous page","nextPage":"next page","lastPage":"last page"}},"filters":{"field":"Field","value":"Value","addFilter":"Add filter","clearFilters":"Clear filters","filter":"Filter","operator":"Operator","operators":{"equals":"equals","in":"in","specified":"specified","unspecified":"unspecified","contains":"contains"}},"entities":{"manageusers":{"deleteDialog":{"title":"Delete manageusers","description":"Are you sure?"},"resetDialog":{"title":"Reset notifications if they exists, otherwise create accounts, transactions and notifications","description":"Are you sure?"},"noItems":"No manageusers available","id":"ID","username":"Username","firstName":"First Name","lastName":"Last Name","email":"Email"}}}')}},[[107,1,2]]]);
//# sourceMappingURL=main.2886f8da.chunk.js.map