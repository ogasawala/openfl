package openfl.display;


import lime.app.Application in LimeApplication;
import lime.app.Config;
import openfl.Lib;


class Application extends LimeApplication {
	
	
	public function new () {
		
		super ();
		
		if (Lib.application == null) {
			
			Lib.application = this;
			
		}
		
	}
	
	
	public override function create (config:Config):Void {
		
		this.config = config;
		
		backend.create (config);
		
		if (Reflect.hasField (config, "fps")) {
			
			frameRate = config.fps;
			
		}
		
		if (Reflect.hasField (config, "windows")) {
			
			for (windowConfig in config.windows) {
				
				var window = new Window (windowConfig);
				addWindow (window);
				
				if (Lib.current.stage == null) {
					
					window.stage.addChild (Lib.current);
					
				}
				
				#if (flash || html5)
				break;
				#end
				
			}
			
		}
		
		init (this);
		
	}
	
	
}