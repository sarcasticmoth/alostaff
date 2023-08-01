$(function(){

	(function(){
	
		return {
		
			route: "",
			
			KEY: "last_posted",
			
			init: function(){
				this.route = proboards.data("route").name;
				
				if(this.route == "members"){
					this.setup();
					this.add_column();
					proboards.on("afterSearch", $.proxy(this.add_column, this));
				}
				
				if(this.route == "thread" || $.inArray(this.route, ["new_post", "quote_posts", "new_thread"]) != -1){
					this.bind_event();
				}
			},
			
			setup: function(){
				
			},
			
			bind_event: function(){
				var form = $("form.form_post_quick_reply, form.form_post_new, form.form_thread_new");

				if(form.length){
					var hook = (form.attr("class") == "form_thread_new")? "thread_new" : ((form.attr("class") == "form_post_quick_reply")? "post_quick_reply" : "post_new");
					
					proboards.plugin.key(this.KEY).set_on(hook, null, + new Date());
				}
			},
			
			add_column: function(){
				var list = $(".container.members table.list");

				if(!list.find("tr.head th.last-posted").length){
					$("<th style='text-align: left; width: 17%' class='last-posted'>Last Posted</th>").insertBefore(list.find("tr.head th.last-online"));
				}
				
				var trs = list.find("tr.member");
				var self = this;
				
				trs.each(function(){
					var id = (this.id.match(/member-(\d+)/))? RegExp.$1 : 0;
					var last_posted = "No Information";
					var key_obj = proboards.plugin.key(self.KEY);
				
					if(key_obj){
						var ts = key_obj.get(id);
				
						if(ts && ts.toString().length){
							last_posted = '<span class="date"><abbr title="' + new Date(parseInt(ts)) + '" class="time" data-timestamp="' + ts + '"></abbr></span>'
						}
					}
								
					$("<td><em>" + last_posted + "</em></td>").insertBefore($(this).find("td.last-online"));
				});
			}
		
		};
	
	})().init();

});