# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "tinymce", "skins")
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "tinymce", "plugins")
# Rails.application.config.assets.paths << Rails.root.join("app", "assets", "common")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( googlefonts.css )
#Rails.application.config.assets.precompile << "tinymce-jquery.js"
#Rails.application.config.assets.precompile += %w( tinymce/themes/modern/* tinymce/plugins/image/* tinymce/plugins/link/* tinymce/plugins/hr/* tinymce/plugins/imagetools/* tinymce/plugins/code/* tinymce/plugins/charmap/* tinymce/plugins/paste/* tinymce/plugins/media/* tinymce/plugins/nonbreaking/* tinymce/plugins/* tinymce/plugins/table/* tinymce/plugins/textcolor/* )
#Rails.application.config.assets.prefix = '/11_szmigiel/webbooks/assets/'
Rails.application.config.tinymce.base = 'http://leszczyna.wzks.uj.edu.pl/11_szmigiel/webbooks/assets/tinymce'
