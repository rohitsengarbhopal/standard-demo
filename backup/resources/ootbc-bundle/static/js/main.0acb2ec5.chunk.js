(this["webpackJsonpheader-config"]=this["webpackJsonpheader-config"]||[]).push([[0],{15:function(e,t,n){e.exports=n(22)},16:function(e,t,n){},21:function(e,t,n){},22:function(e,t,n){"use strict";n.r(t);n(16);var a=n(7),i=n(8),l=n(9),r=n(11),m=n(14),s=n(0),u=n.n(s),c=n(13),o=n.n(c),h=n(3),d=n(6),b=n(1),g=n(2),v=(n(21),function(e){Object(l.a)(n,e);var t=Object(r.a)(n);function n(e){var i;return Object(a.a)(this,n),(i=t.call(this,e)).state={logo:"Entando_light.svg",logoRedirectPage:"homepage",theme:"",tagline:"Entando Ootb",sideNavigation:!0,icon:"",icons:"[InfoCircle_BlueTheme.svg, Envelope_BlueTheme.svg, SignIn_BlueTheme.svg]",menuItem:"",menuItems:'[{menuItem: Smart Inbox, submenuItems: ["Sea", Lake]}, {menuItem: Excursions, submenuItems: [""]}]'},i.handleChange=i.handleChange.bind(Object(g.a)(i)),i.handleAddIcon=i.handleAddIcon.bind(Object(g.a)(i)),i.handleAddMenuItem=i.handleAddMenuItem.bind(Object(g.a)(i)),i.handleAddSubmenuItem=i.handleAddSubmenuItem.bind(Object(g.a)(i)),i.handleRemoveIcon=i.handleRemoveIcon.bind(Object(g.a)(i)),i.handleRemoveMenuItem=i.handleRemoveMenuItem.bind(Object(g.a)(i)),i.handleRemoveSubmenuItem=i.handleRemoveSubmenuItem.bind(Object(g.a)(i)),i.menuItemsToArray=i.menuItemsToArray.bind(Object(g.a)(i)),i.iconsToArray=i.iconsToArray.bind(Object(g.a)(i)),i}return Object(i.a)(n,[{key:"menuItemsToArray",value:function(e){var t=[];if("string"===typeof e){var n=e.replace(/(^\[)|(]$)/g,"");(n=n.split(/},\s*/g)).forEach((function(e){var n={menuItem:"",submenuItems:[]},a=(e=e.replace(/(menuItem(:|=)\s*)|(submenuItems(:|=)\s*)/g,"")).split(/^{?(\w+\s*\w*),/g);if(n.menuItem=a.length>0?a[1]:[0],a[2]){var i=a[2].replace(/\s|\[|]|}|"/g,"").split(/,/g);i&&1===i.length&&i[0]&&/""/g.test(i[0])?n.submenuItems.push(i[0]):i&&i.length>1&&(n.submenuItems=i)}t.push(n)})),this.setState({menuItems:t})}}},{key:"iconsToArray",value:function(e){var t=[];"string"===typeof e&&(e.replace(/^\[|]$/g,"").split(/}?,\s*/g).forEach((function(e){var n=e.split(/^{(\w*),*/g)[0];t.push(n)})),this.setState({icons:t}))}},{key:"componentDidMount",value:function(){var e=this.state,t=e.icons,n=e.menuItems,a=e.sideNavigation;"string"===typeof n&&this.menuItemsToArray(n),"string"===typeof t&&this.iconsToArray(t),"string"===typeof a&&this.setState({sideNavigation:"true"===a})}},{key:"componentDidUpdate",value:function(e,t,n){var a=this.state,i=a.icons,l=a.menuItems,r=a.sideNavigation;t.icons!==i&&"string"===typeof i&&this.iconsToArray(i),t.menuItems!==l&&"string"===typeof l&&this.menuItemsToArray(l),t.sideNavigation!==r&&"string"===typeof r&&this.setState({sideNavigation:"true"===r})}},{key:"handleChange",value:function(e,t){this.setState((function(n){return Object(b.a)(Object(b.a)({},n),{},Object(d.a)({},e,t))}))}},{key:"handleAddIcon",value:function(){var e=this.state,t=e.icon,n=e.icons,a=Object(h.a)(n);t&&(n.length<6?(a.push(t),this.setState((function(e){return Object(b.a)(Object(b.a)({},e),{},{icons:a})}))):alert("There are already six icons"))}},{key:"handleAddMenuItem",value:function(){var e=this.state,t=e.sideNavigation,n=e.menuItem,a=e.menuItems,i=Object(h.a)(a);n&&(!t&&a.length<6||t?(i.push({menuItem:n,submenuItems:[]}),this.setState((function(e){return Object(b.a)(Object(b.a)({},e),{},{menuItems:i})}))):alert("There are already six menu items"))}},{key:"handleAddSubmenuItem",value:function(e){var t=this.state,n=t.sideNavigation,a=t.menuItems,i=this.state["submenuItem"+e],l=Object(h.a)(a),r=Object(b.a)({},a[e]),m=[];r.submenuItems&&(m=Object(h.a)(r.submenuItems)),r&&m&&n&&this.state["submenuItem"+e]&&(m.length<6||n?(m.push(i),r.submenuItems=m,l[e]=r,this.setState((function(e){return Object(b.a)(Object(b.a)({},e),{},{menuItems:l})}))):alert("There are already six menu items"))}},{key:"handleRemoveIcon",value:function(e){var t=this.state.icons,n=Object(h.a)(t);n.splice(e,1),this.setState((function(e){return Object(b.a)(Object(b.a)({},e),{},{icons:n})}))}},{key:"handleRemoveMenuItem",value:function(e){var t=this.state.menuItems,n=Object(h.a)(t);n.splice(e,1),this.setState((function(t){return Object(b.a)(Object(b.a)({},t),{},Object(d.a)({menuItems:n},"submenuItem"+e,""))}))}},{key:"handleRemoveSubmenuItem",value:function(e,t){var n=this.state,a=n.sideNavigation,i=n.menuItems;if(a){var l=Object(h.a)(i),r=Object(b.a)({},i[e]),m=Object(h.a)(r.submenuItems);m.splice(t,1),r.submenuItems=m,l[e]=r,this.setState((function(e){return Object(b.a)(Object(b.a)({},e),{},{menuItems:l})}))}}},{key:"render",value:function(){var e=this,t=this.state,n=t.logo,a=t.theme,i=t.tagline,l=t.sideNavigation,r=this.state,m=r.icon,s=r.icons,c=r.menuItem,o=r.menuItems,h={display:"block",height:"1px",border:"0",borderTop:"1px solid #ccc",margin:"0.3em 0",padding:"0"},d={width:"50%"},g={fontSize:"12px",margin:"0 calc(10% + 2rem)"},v={width:"20%",display:"inline-block",margin:"1rem"},I={display:"flex"},y={width:"calc(100% / 3)"},f={margin:"0 1rem",display:"inline-block"},p=Object(b.a)(Object(b.a)({},f),{},{width:"10%"}),E={marginLeft:"1em"};return u.a.createElement("div",null,u.a.createElement("h1",null,"Entando 6 Header Configuration"),u.a.createElement("div",{style:I},u.a.createElement("div",{style:y},u.a.createElement("label",{style:p,htmlFor:"theme"},"Theme"),u.a.createElement("input",{style:d,id:"theme",onChange:function(t){return e.handleChange(t.target.id,t.target.value.trim())},value:a}),u.a.createElement("p",{style:g},"Insert the theme")),u.a.createElement("div",{style:y},u.a.createElement("label",{style:p,htmlFor:"logo"},"Logo"),u.a.createElement("input",{style:d,id:"logo",onChange:function(t){return e.handleChange(t.target.id,t.target.value.trim())},value:n}),u.a.createElement("p",{style:g},"Insert the logo filename")),u.a.createElement("div",{style:y},u.a.createElement("label",{style:p,htmlFor:"tagline"},"Tagline"),u.a.createElement("input",{style:d,id:"tagline",onChange:function(t){return e.handleChange(t.target.id,t.target.value)},value:i}),u.a.createElement("p",{style:g},"Insert the tagline"))),u.a.createElement("hr",{style:h}),u.a.createElement("div",null,u.a.createElement("label",{style:f,htmlFor:"icon"},"Header Icons - ",u.a.createElement("small",null,"Insert the icons filenames")),u.a.createElement("div",null,u.a.createElement("input",{style:E,id:"icon",onChange:function(t){return e.handleChange(t.target.id,t.target.value.trim())},value:m}),u.a.createElement("button",{onClick:this.handleAddIcon},"+")),s&&"string"!==typeof s&&u.a.createElement("div",{style:E},s.map((function(t,n){return u.a.createElement("p",{key:n,style:f},u.a.createElement("button",{onClick:function(){return e.handleRemoveIcon(n)}},"x"),u.a.createElement("span",{style:v},t))})))),u.a.createElement("hr",{style:h}),u.a.createElement("div",null,u.a.createElement("label",{style:p},"Side Navigation"),u.a.createElement("input",{type:"checkbox",checked:l,onChange:function(){return o.length<7?e.handleChange("sideNavigation",!l):alert("Delete one or more menu items")}}),u.a.createElement("div",null,u.a.createElement("label",{style:f,htmlFor:"menuItem"},"Menu Items - ",u.a.createElement("small",null,"Insert the menu item")),u.a.createElement("div",null,u.a.createElement("input",{style:E,id:"menuItem",onChange:function(t){return e.handleChange(t.target.id,t.target.value)},value:c}),u.a.createElement("button",{onClick:this.handleAddMenuItem},"+")),o&&"string"!==typeof o&&u.a.createElement("div",{style:E},o.map((function(t,n){return u.a.createElement("div",{key:n,style:I},u.a.createElement("button",{style:{margin:"1rem 0",maxHeight:"26px"},onClick:function(){return e.handleRemoveMenuItem(n)}},"x"),u.a.createElement("span",{style:Object(b.a)(Object(b.a)({},v),{},{margin:"1rem 0",border:"1px solid lightgrey",maxHeight:"24px"})},t.menuItem),l&&u.a.createElement("div",{style:{margin:"1rem 0",width:"100%"}},u.a.createElement("div",null,u.a.createElement("label",{style:f,htmlFor:"submenuItem"},"Submenu Items -"),u.a.createElement("div",{style:{display:"inline-block"}},u.a.createElement("input",{style:E,id:"submenuItem"+n,onChange:function(t){return e.handleChange(t.target.id,t.target.value)},value:e.state["submenuItem"+n]}),u.a.createElement("button",{onClick:function(){return e.handleAddSubmenuItem(n)}},"+"))),o[n].submenuItems&&"string"!==typeof o[n].submenuItems&&u.a.createElement("div",{style:{marginLeft:"150px",width:"80%"}},o[n].submenuItems.map((function(t,a){return u.a.createElement("div",{key:a,style:Object(b.a)(Object(b.a)({},f),{},{display:"inline-flex",width:"calc(80%/7 - 1rem)"})},u.a.createElement("button",{style:{margin:"1rem 0",maxHeight:"26px"},onClick:function(){return e.handleRemoveSubmenuItem(n,a)}},"x"),u.a.createElement("span",{style:Object(b.a)(Object(b.a)({},v),{},{margin:"1rem 0",border:"1px solid lightgrey",maxHeight:"24px",width:"70%"})},t))})))))}))))))}}]),n}(s.Component)),I=function(e){Object(l.a)(n,e);var t=Object(r.a)(n);function n(){var e;return Object(a.a)(this,n),(e=t.call(this)).reactRootRef=u.a.createRef(),e.mountPoint=null,e}return Object(i.a)(n,[{key:"connectedCallback",value:function(){this.mountPoint=document.createElement("div"),this.appendChild(this.mountPoint),o.a.render(u.a.createElement(v,{ref:this.reactRootRef}),this.mountPoint)}},{key:"config",get:function(){return this.reactRootRef.current?this.reactRootRef.current.state:{}},set:function(e){return this.reactRootRef.current.setState(e)}}]),n}(Object(m.a)(HTMLElement));customElements.define("header-config",I)}},[[15,1,2]]]);
//# sourceMappingURL=main.0acb2ec5.chunk.js.map