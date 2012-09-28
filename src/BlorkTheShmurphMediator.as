package
{
	import crm.gobelins.darkunicorn.services.SoundManager;
	import crm.gobelins.darkunicorn.signals.GamePauseSignal;
	import crm.gobelins.darkunicorn.signals.GameRestartSignal;
	import crm.gobelins.darkunicorn.signals.GameResumeSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class BlorkTheShmurphMediator extends Mediator
	{
		[Inject]
		public var view : BlorkTheSmurff;
		[Inject]
		public var pause_signal : GamePauseSignal;
		[Inject]
		public var resume_signal : GameResumeSignal;
		[Inject]
		public var restart_signal : GameRestartSignal;
		[Inject]
		public var sound_mgr : SoundManager;
		
		override public function onRegister():void{
			pause_signal.add(_onPauseClicked);
			resume_signal.add(_onResumeClicked);
			restart_signal.add(_onRestartClicked);
			
			view.sound_toggle_signal.add(_onSoundStopped);
		}
		
		private function _onSoundStopped():void
		{
			sound_mgr.toggleSound();
		}
		
		private function _onResumeClicked():void
		{
			//view.resumeGame();
		}
		
		private function _onPauseClicked():void
		{
			//view.pauseGame();
		}
		
		private function _onRestartClicked():void{
			//view.restartGame();
		}
	}
}