'''
' Streaming Community (Italia) YT-DLP launcher. 
'''
### LIBRARIES ###

from scuapi import API
from sys import argv
from tabulate import tabulate                                               # requires "pip install tabulate"
from os import system


### PARAMETERS ###

domain = "StreamingCommunity.foo"
exe_path = "C:\\Users\\Filippo\\Downloads\\TORRENT\\_streaming_community_yt_dlp\\yt-dlp.exe"


### FUNCTIONS ###

def get_input_pattern( ) :
  pattern_len = len(argv)                                                   # number of pattern-text words
  if pattern_len < 2 :
      raise Exception("Not enough input arguments provided.")
  else :
    pattern_text = str(argv[1])                                             # pattern-text to be found parsed from command
    for j in range(2,pattern_len) :
        pattern_text = pattern_text+' '+str(argv[j])
  return pattern_text

def search_all_results( domain, pattern ) :
  log_txt = ''
  log_txt += '\n >> Searching for "'+pattern+'" on "'+domain+'"\n\n'
  api_object = API(domain)
  results_dict = api_object.search(pattern)
  results_len = len(results_dict)
  if results_len > 0 :
    log_txt += ' >> All results:\n'
    results_keys = list(results_dict.keys())
    results_list = []
    for j in range(results_len) :
      res_name = results_keys[j]
      res_type = results_dict[res_name]['type']
      results_list.append([str(j),res_name,res_type.upper()])
    headers_list =["Index", "Name", "Type"]
    tab_text = tabulate(results_list, headers=headers_list, tablefmt="grid")
    log_txt += tab_text
  else :
    log_txt += ' >> No results found!'
  results_struct = {'api': api_object, 'dict': results_dict, 'txt':log_txt}
  return results_struct

def search_specific_link( all_results_struct, idx ) :
  log_txt = ''
  all_results_keys = list(all_results_struct['dict'].keys())
  sres_link = all_results_struct['dict'][all_results_keys[idx]]['url']
  sres_info = all_results_struct['api'].load(sres_link)
  sres_type = all_results_struct['dict'][all_results_keys[idx]]['type']
  if sres_type == 'tv' :
    all_links = []
    tab_list = []
    episodes_list = sres_info['episodeList']
    episodes_number = len(episodes_list)
    log_txt += '\n >> Results for "'+str(all_results_keys[idx])+'": ' \
      'Seasons: '+str(sres_info['seasons_count'])+' | Episodes: '+str(len(episodes_list))+'\n'
    for j in range(episodes_number) :
      episode_number = str(episodes_list[j]['season'])+'x'+str(episodes_list[j]['episode'])
      episode_name = str(episodes_list[j]['name'])
      episode_link = episodes_list[j]['url']
      all_links.append(episode_link)
      tab_list.append([str(j), episode_number,episode_name,episode_link])
    headers_list =["Index", "Number", "Name", "Link"]
    tab_text = tabulate(tab_list, headers=headers_list, tablefmt="grid")
    log_txt += tab_text
  elif sres_type == 'movie' :
    all_links = []
    tab_list = []
    movie_link = sres_info['url']
    all_links.append(movie_link)
    tab_list.append([movie_link])
    headers_list =["Link"]
    tab_text = tabulate(tab_list, headers=headers_list, tablefmt="grid")
    log_txt += '\n >> Results for "'+str(all_results_keys[idx])+'":\n'
    log_txt += tab_text
  else :
    raise Exception('Invalid type: '+str(sres_type))
  return log_txt, all_links


### PROCESSING ###

pattern_text = get_input_pattern()
results_struct = search_all_results(domain,pattern_text)                    # retrieve all results for specified pattern
print(results_struct['txt'])                                                # print all results found
if len(results_struct['dict']) > 0 :    
  msg = '\n << Choose index: '
  res_idx = int(input(msg))                                                 # ask for specific result index
  log_txt, links = search_specific_link(results_struct, res_idx)
  print(log_txt)
  results_struct['txt'] += '\n'+msg+str(res_idx)+'\n'+log_txt
with open("results.txt",'w',encoding='utf-8') as fid :
  fid.write(str(results_struct['txt']))                                     # save run history and results into .txt file
if len(results_struct['dict']) > 0 :
  if len(links) > 1 :
    rng = input('\n<< Choose range: ')                                      # ask for download indexes/range [see NOTE#1]
    dl_idx = eval(rng)
  else : 
    dl_idx = [0]
  print('\n>> Start downloading\n')
  for j in range(len(links)) :
    if j in dl_idx :
      system(exe_path+' '+str(links[j]))
      print('\n')


### NOTES ###

# 0. Use "cls && python launcher.py PATTERN" to run the research/download.

# 1. Use one of the following to specify the download-range:
#    - "range(X,Y+1)" to get all files corresponding to indexes between X and Y;
#    - "[X,Y,Z]" or "[K]" to get the files corresponding to the specific indexes X, Y and Z or K only.
