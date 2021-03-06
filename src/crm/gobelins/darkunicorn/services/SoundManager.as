package crm.gobelins.darkunicorn.services
{
	import com.greensock.TweenNano;
	
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;

	public class SoundManager
	{
		[Embed(source="../../../../../medias/sounds/ambiantLoop.mp3")]
		public var ambiant : Class;
		
		protected var _sTrans : SoundTransform;
		protected var _sound : Sound;
		protected var _musicChannel : SoundChannel;
		protected var _soundEnabled : Boolean;
		
		public function SoundManager()
		{
			_sTrans = new SoundTransform();
			_sound = Sound(new ambiant()); 
		}
		
		protected function _onSoundComplete(event:Event):void
		{
			_musicChannel.removeEventListener(Event.SOUND_COMPLETE,_onSoundComplete);
			playMusic();
		}
		
		public function playMusic() : void{
			_musicChannel = _sound.play();
			_musicChannel.addEventListener(Event.SOUND_COMPLETE,_onSoundComplete);
			_soundEnabled = true;
		}
		
		public function fadeOutMusic() : void{
			_musicChannel.removeEventListener(Event.SOUND_COMPLETE,_onSoundComplete);
			TweenNano.to(_sTrans,1,{ volume : 0, onUpdate : _updateMusicSoundTrans} );
		}
		
		public function fadeInMusic() : void{
			playMusic();
			TweenNano.to(_sTrans,1,{ volume : 1, onUpdate : _updateMusicSoundTrans} );
		}
		
		public function fadeOutSound() : void{
			TweenNano.to(_sTrans,1,{ volume : 0, onUpdate : _updateSoundTrans} );			
			_soundEnabled = false;
		}
		
		public function fadeInSound() : void {
			TweenNano.to(_sTrans,1,{ volume : 1, onUpdate : _updateSoundTrans} );			
			_soundEnabled = true;
		}
		
		protected function _updateSoundTrans() : void{			
			SoundMixer.soundTransform = _sTrans;
		}
		protected function _updateMusicSoundTrans() : void{			
			_musicChannel.soundTransform = _sTrans;
		}
		
		public function toggleSound():void
		{
			if( _soundEnabled )
				fadeOutSound();
			else
				fadeInSound();
		}
	}
}