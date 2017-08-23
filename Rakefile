desc 'Setup dotfiles'
task :setup do

  system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
 
  Dir.foreach(Dir.pwd) do |file| 
    next if file =~ /^[.]{1,2}\z/

    lns(file, file)
  end
   
  system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  system "curl -fo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  system "brew bundle"
  system "chsh -s /bin/zsh"
  system "mkdir ~/.vim/colors/"
  system "mkdir ~/.zsh_customisations"
  system "mkdir ~/.zsh_customisations/themes/"
  lns("./colours/hybrid.vim", ".vim/colors/hybrid.vim")
  lns("./themes/dg.zsh-theme", ".zsh_customisations/themes/dg.zsh-theme")
end

# ln -s 
def lns(from, to)
  from = File.expand_path(from) 
  to = "#{ Dir.home }/#{ to }"

  File.symlink(from, to)
rescue Errno::EEXIST
  puts "#{ from } could not be symlinked."
end
