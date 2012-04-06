function rpg(config) {
	config.ui = config.ui || {};

	var path = [];
	var ui = {
		options : config.ui.options || $('#rpg_options'),
		text : config.ui.text || $('#rpg_text'),
		printout : function(current) {
			ui.text.html(current.text);
			var lis = $(current.targets).map(function(t) { 
				var code = this[0];
				var text = this[1];
				var target = this[2];
				return "<li><a href='#' class='rpg_nav' data-goto='" + target + "' data-code='" + code + "'>" + text + "</a></li>";
			});
			var content = lis.get().join('\n');
			ui.options.html(content);
		}
	};
	
	var game = {
		start : function() {
			this.select('start', 0);
		},
		nothing : function(goon) {
			goon();
		},
		select : function(code, step) {
			path.push([code, step]);
			
			if(step < 0) {
				$('#rpg_path').val(path);
				$('#rpg_form').submit();
				return;
			}
			
			var current = config.steps[step];
			function carryOn() { ui.printout(current); };
			(current.before || this.nothing)(carryOn);
		}
	};
	
	$('.rpg_nav').live('click', function(e) {
		e.preventDefault();
		var step = $(this).data('goto');
		var code = $(this).data('code');
		game.select(code, step);
	});
	return game;
}