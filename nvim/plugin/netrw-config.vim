let g:netrw_banner = 0                                                          
let g:netrw_liststyle = 3                                                       
let g:netrw_browse_split = 4                                                    
let g:netrw_altv = 1                                                            
let g:netrw_winsize = 20                                                        
                                                                                
function OpenToRight()                                                          
   :normal v                                                                    
   let g:path=expand('%:p')                                                     
   :q!                                                                          
   execute 'belowright vnew' g:path                                             
   :normal <C-l>                                                                
endfunction 
