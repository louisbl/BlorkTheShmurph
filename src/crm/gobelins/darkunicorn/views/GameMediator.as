package crm.gobelins.darkunicorn.views
{
	import com.gobelins.DarkUnicorn.DarkUnicornGameCore;
	
	import crm.gobelins.darkunicorn.services.ScoreService;
	import crm.gobelins.darkunicorn.services.SoundManager;
	import crm.gobelins.darkunicorn.signals.GamePauseSignal;
	import crm.gobelins.darkunicorn.signals.GameRestartSignal;
	import crm.gobelins.darkunicorn.signals.GameResumeSignal;
	import crm.gobelins.darkunicorn.signals.GotoHomeSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class GameMediator extends Mediator
	{
		[Inject]
		public var view : GameView;
		[Inject]
		public var home_sig : GotoHomeSignal;
		[Inject]
		public var score_serv : ScoreService;
		[Inject]
		public var pause_signal : GamePauseSignal;
		[Inject]
		public var resume_signal : GameResumeSignal;
		[Inject]
		public var restart_signal : GameRestartSignal;
		[Inject]
		public var sound_mgr : SoundManager;
		[Inject]
		public var blork : DarkUnicornGameCore;
		
		override public function onRegister():void{
			view.finish_signal.add(_onFinish);
			view.btn_cancel_signal.add(_onCancelClicked);
			view.paused_signal.add(_onPauseClicked);
			view.resume_signal.add(_onResumeClicked);
			
			sound_mgr.fadeOutMusic();
			restart_signal.dispatch();
			view.restartGame(blork);
		}
		
		override public function onRemove():void{
			view.finish_signal.removeAll();
			view.btn_cancel_signal.removeAll();
			view.paused_signal.removeAll();
			view.resume_signal.removeAll();

			sound_mgr.fadeInMusic();
		}
		
		private function _onResumeClicked():void
		{
			resume_signal.dispatch();
		}
		
		private function _onPauseClicked():void
		{
			pause_signal.dispatch();
		}
		
		protected function _onScoreClicked():void
		{
			pause_signal.dispatch();
			_onFinish( 3800 );
		}
		
		protected function _onFinish( score : int ) : void {
			pause_signal.dispatch();
			score_serv.setScore( score );
		}
		
		protected function _onCancelClicked():void
		{
			home_sig.dispatch();
		}
	}
}