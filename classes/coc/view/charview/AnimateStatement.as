package coc.view.charview {
import coc.view.CompositeImage;
import coc.xlogic.ExecContext;
import coc.xlogic.Statement;

public class AnimateStatement extends Statement {
	private var image:CompositeImage;
	private var part:String;
	private var animation:String;
	private var _prefix:Boolean;
	private var _hasVars:Boolean;
	
	public function AnimateStatement(image:CompositeImage, part:String, name:String) {
		this.image = image;
		this.animation = name;
		this._prefix = CharViewCompiler.partIsPrefix(part);
		this.part = _prefix ? CharViewCompiler.partPrefix(part) : part;
		this._hasVars = CharViewCompiler.nameHasVars(part);
	}
	
	override public function execute(context:ExecContext):void {
		var name:String = this.animation;
		if (_hasVars) {
			name = context.substituteVars(name);
		}
		if (_prefix) {
			image.setAnimation(part, true, name);
		} else {
			image.setAnimation(part, false, name);
		}
	}
	
	public function toString():String {
		return '<animate part="'+part+'" name="'+animation+'"/>'
	}
}
}
