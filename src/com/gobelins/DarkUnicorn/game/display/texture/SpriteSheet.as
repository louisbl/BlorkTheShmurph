package com.gobelins.DarkUnicorn.game.display.texture {
	import flash.display.Bitmap;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	/**
	 * @author Tony Beltramelli - www.tonybeltramelli.com
	 */
	public class SpriteSheet {
		[Embed(source="../../../../../../../medias/spriteSheet.png")]
		private static const _AtlasTextureGame : Class;
		
		[Embed(source="../../../../../../../medias/spriteSheetDescriptor.xml", mimeType="application/octet-stream")]
		private static const _AtlasXmlGame : Class;
		
		[Embed(source="../../../../../../../medias/particle.pex", mimeType="application/octet-stream")]
        public static const ParticleConfig:Class;
        
		[Embed(source = "../../../../../../../medias/texture.png")]
        public static const ParticleTexture:Class;
		
		[Embed(source = "../../../../../../../medias/background.jpg")]
		public static const BackgroundImage:Class;
		
		private static var _gameTextureAtlas : TextureAtlas;

		public static function getBg() : Texture {
			var bmp : Bitmap = Bitmap( new BackgroundImage());
			return Texture.fromBitmap(bmp);
		}
		
		public static function getAtlas() : TextureAtlas
		{
			if (!_gameTextureAtlas)
			{
				var bitmap : Bitmap = Bitmap(new _AtlasTextureGame());
				var texture : Texture = Texture.fromBitmap(bitmap);
				var xml : XML = XML(new _AtlasXmlGame());

				_gameTextureAtlas = new TextureAtlas(texture, xml);
			}

			return _gameTextureAtlas;
		}
	}
}
