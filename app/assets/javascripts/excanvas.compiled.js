  


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>highcharts-rails/javascripts/excanvas.compiled.js at master · loudpixel/highcharts-rails</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    
    

    <meta content="authenticity_token" name="csrf-param" />
<meta content="wZPC0FRQ7tuGagNNaoyGle8oalkEaKqIr5YLiil1kx0=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/stylesheets/bundles/github-4f06bfcb765482de148632653957dde1423a93fc.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/stylesheets/bundles/github2-46369bcd6479421862314f2e59570847210cac02.css" media="screen" rel="stylesheet" type="text/css" />
    
    


    <script src="https://a248.e.akamai.net/assets.github.com/javascripts/bundles/frameworks-a450c7f907bdc1ee6b362ab1ecca811c761fd259.js" type="text/javascript"></script>
    
    <script defer="defer" src="https://a248.e.akamai.net/assets.github.com/javascripts/bundles/github-96cccb25f9b28a80ef5c90ab97de5e9a4d23fd1b.js" type="text/javascript"></script>
    
    

      <link rel='permalink' href='/loudpixel/highcharts-rails/blob/dd4355a3587431608553e6cc347260fecf207239/javascripts/excanvas.compiled.js'>
    <meta property="og:title" content="highcharts-rails"/>
    <meta property="og:type" content="githubog:gitrepository"/>
    <meta property="og:url" content="https://github.com/loudpixel/highcharts-rails"/>
    <meta property="og:image" content="https://a248.e.akamai.net/assets.github.com/images/gravatars/gravatar-140.png?1334862345"/>
    <meta property="og:site_name" content="GitHub"/>
    <meta property="og:description" content="highcharts-rails - A plugin for displaying Highcharts graphs in Rails"/>

    <meta name="description" content="highcharts-rails - A plugin for displaying Highcharts graphs in Rails" />

  <link href="https://github.com/loudpixel/highcharts-rails/commits/master.atom" rel="alternate" title="Recent Commits to highcharts-rails:master" type="application/atom+xml" />

  </head>


  <body class="logged_in page-blob linux vis-public env-production " data-blob-contribs-enabled="yes">
    <div id="wrapper">

    
    
    

      <div id="header" class="true clearfix">
        <div class="container clearfix">
          <a class="site-logo" href="https://github.com/">
            <!--[if IE]>
            <img alt="GitHub" class="github-logo" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7.png?1334862346" />
            <img alt="GitHub" class="github-logo-hover" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7-hover.png?1334862346" />
            <![endif]-->
            <img alt="GitHub" class="github-logo-4x" height="30" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7@4x.png?1337118066" />
            <img alt="GitHub" class="github-logo-4x-hover" height="30" src="https://a248.e.akamai.net/assets.github.com/images/modules/header/logov7@4x-hover.png?1337118066" />
          </a>

              
    <div class="topsearch  ">
        <form accept-charset="UTF-8" action="/search" id="top_search_form" method="get">
  <a href="/search" class="advanced-search tooltipped downwards" title="Advanced Search"><span class="mini-icon mini-icon-advanced-search"></span></a>
  <div class="search placeholder-field js-placeholder-field">
    <input type="text" class="search my_repos_autocompleter" id="global-search-field" name="q" results="5" spellcheck="false" autocomplete="off" data-autocomplete="my-repos-autocomplete" placeholder="Search&hellip;" data-hotkey="s" />
    <div id="my-repos-autocomplete" class="autocomplete-results">
      <ul class="js-navigation-container"></ul>
    </div>
    <input type="submit" value="Search" class="button">
    <span class="mini-icon mini-icon-search-input"></span>
  </div>
  <input type="hidden" name="type" value="Everything" />
  <input type="hidden" name="repo" value="" />
  <input type="hidden" name="langOverride" value="" />
  <input type="hidden" name="start_value" value="1" />
</form>

      <ul class="top-nav">
          <li class="explore"><a href="https://github.com/explore">Explore</a></li>
          <li><a href="https://gist.github.com">Gist</a></li>
          <li><a href="/blog">Blog</a></li>
        <li><a href="http://help.github.com">Help</a></li>
      </ul>
    </div>


            


  <div id="userbox">
    <div id="user">
      <a href="https://github.com/arthur073"><img height="20" src="https://secure.gravatar.com/avatar/2ba9d22cee2b4980fbfa46ff5a6b24a2?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="20" /></a>
      <a href="https://github.com/arthur073" class="name">arthur073</a>
    </div>
    <ul id="user-links">
      <li>
        <a href="/new" id="new_repo" class="tooltipped downwards" title="Create a New Repo"><span class="mini-icon mini-icon-create"></span></a>
      </li>
      <li>
        <a href="/inbox/notifications" id="notifications" class="tooltipped downwards" title="Notifications">
          <span class="mini-icon mini-icon-notifications"></span>
        </a>
      </li>
      <li>
        <a href="/settings/profile" id="settings" class="tooltipped downwards" title="Account Settings">
          <span class="mini-icon mini-icon-account-settings"></span>
        </a>
      </li>
      <li>
          <a href="/logout" data-method="post" id="logout" class="tooltipped downwards" title="Log Out">
            <span class="mini-icon mini-icon-logout"></span>
          </a>
      </li>
    </ul>
  </div>



          
        </div>
      </div>

      

            <div class="site hfeed" itemscope itemtype="http://schema.org/WebPage">
      <div class="container hentry">
        <div class="pagehead repohead instapaper_ignore readability-menu">
        <div class="title-actions-bar">
          



              <ul class="pagehead-actions">



          <li class="js-toggler-container js-social-container watch-button-container ">
            <span class="watch-button"><a href="/loudpixel/highcharts-rails/toggle_watch" class="minibutton btn-watch js-toggler-target lighter" data-remote="true" data-method="post" rel="nofollow"><span class="icon"></span> Watch</a><a class="social-count js-social-count" href="/loudpixel/highcharts-rails/watchers">68</a></span>
            <span class="unwatch-button"><a href="/loudpixel/highcharts-rails/toggle_watch" class="minibutton btn-unwatch js-toggler-target lighter" data-remote="true" data-method="post" rel="nofollow"><span class="icon"></span> Unwatch</a><a class="social-count js-social-count" href="/loudpixel/highcharts-rails/watchers">68</a></span>
          </li>

              <li><a href="/loudpixel/highcharts-rails/fork" class="minibutton btn-fork js-toggler-target fork-button lighter" rel="nofollow" data-method="post"><span class="icon"></span> Fork</a><a href="/loudpixel/highcharts-rails/network" class="social-count">13</a>
              </li>


    </ul>

          <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
            <span class="repo-label"><span>public</span></span>
            <span class="mega-icon mega-icon-public-repo"></span>
            <span class="author vcard">
<a href="/loudpixel" class="url fn" itemprop="url" rel="author">              <span itemprop="title">loudpixel</span>
              </a></span> /
            <strong><a href="/loudpixel/highcharts-rails" class="js-current-repository">highcharts-rails</a></strong>
          </h1>
        </div>

          

  <ul class="tabs">
    <li><a href="/loudpixel/highcharts-rails" class="selected" highlight="repo_sourcerepo_downloadsrepo_commitsrepo_tagsrepo_branches">Code</a></li>
    <li><a href="/loudpixel/highcharts-rails/network" highlight="repo_network">Network</a>
    <li><a href="/loudpixel/highcharts-rails/pulls" highlight="repo_pulls">Pull Requests <span class='counter'>0</span></a></li>

      <li><a href="/loudpixel/highcharts-rails/issues" highlight="repo_issues">Issues <span class='counter'>0</span></a></li>

      <li><a href="/loudpixel/highcharts-rails/wiki" highlight="repo_wiki">Wiki</a></li>

    <li><a href="/loudpixel/highcharts-rails/graphs" highlight="repo_graphsrepo_contributors">Graphs</a></li>

  </ul>
 
<div class="frame frame-center tree-finder" style="display:none"
      data-tree-list-url="/loudpixel/highcharts-rails/tree-list/dd4355a3587431608553e6cc347260fecf207239"
      data-blob-url-prefix="/loudpixel/highcharts-rails/blob/dd4355a3587431608553e6cc347260fecf207239"
    >

  <div class="breadcrumb">
    <span class="bold"><a href="/loudpixel/highcharts-rails">highcharts-rails</a></span> /
    <input class="tree-finder-input js-navigation-enable" type="text" name="query" autocomplete="off" spellcheck="false">
  </div>

    <div class="octotip">
      <p>
        <a href="/loudpixel/highcharts-rails/dismiss-tree-finder-help" class="dismiss js-dismiss-tree-list-help" title="Hide this notice forever" rel="nofollow">Dismiss</a>
        <span class="bold">Octotip:</span> You've activated the <em>file finder</em>
        by pressing <span class="kbd">t</span> Start typing to filter the
        file list. Use <span class="kbd badmono">↑</span> and
        <span class="kbd badmono">↓</span> to navigate,
        <span class="kbd">enter</span> to view files.
      </p>
    </div>

  <table class="tree-browser" cellpadding="0" cellspacing="0">
    <tr class="js-header"><th>&nbsp;</th><th>name</th></tr>
    <tr class="js-no-results no-results" style="display: none">
      <th colspan="2">No matching files</th>
    </tr>
    <tbody class="js-results-list js-navigation-container">
    </tbody>
  </table>
</div>

<div id="jump-to-line" style="display:none">
  <h2>Jump to Line</h2>
  <form accept-charset="UTF-8">
    <input class="textfield" type="text">
    <div class="full-button">
      <button type="submit" class="classy">
        <span>Go</span>
      </button>
    </div>
  </form>
</div>


<div class="subnav-bar">

  <ul class="actions subnav">
    <li><a href="/loudpixel/highcharts-rails/tags" class="blank" highlight="repo_tags">Tags <span class="counter">0</span></a></li>
    <li><a href="/loudpixel/highcharts-rails/downloads" class="blank downloads-blank" highlight="repo_downloads">Downloads <span class="counter">0</span></a></li>
    
  </ul>

  <ul class="scope">
    <li class="switcher">

      <div class="context-menu-container js-menu-container js-context-menu">
        <a href="#"
           class="minibutton bigger switcher js-menu-target js-commitish-button btn-branch repo-tree"
           data-hotkey="w"
           data-master-branch="master"
           data-ref="master">
           <span><span class="icon"></span><i>branch:</i> master</span>
        </a>

        <div class="context-pane commitish-context js-menu-content">
          <a href="javascript:;" class="close js-menu-close"><span class="mini-icon mini-icon-remove-close"></span></a>
          <div class="context-title">Switch Branches/Tags</div>
          <div class="context-body pane-selector commitish-selector js-navigation-container">
            <div class="filterbar">
              <input type="text" id="context-commitish-filter-field" class="js-navigation-enable" placeholder="Filter branches/tags" data-filterable />

              <ul class="tabs">
                <li><a href="#" data-filter="branches" class="selected">Branches</a></li>
                <li><a href="#" data-filter="tags">Tags</a></li>
              </ul>
            </div>

            <div class="js-filter-tab js-filter-branches" data-filterable-for="context-commitish-filter-field">
              <div class="no-results js-not-filterable">Nothing to show</div>
                <div class="commitish-item branch-commitish selector-item js-navigation-item js-navigation-target">
                  <h4>
                      <a href="/loudpixel/highcharts-rails/blob/master/javascripts/excanvas.compiled.js" class="js-navigation-open" data-name="master" rel="nofollow">master</a>
                  </h4>
                </div>
            </div>

            <div class="js-filter-tab js-filter-tags" style="display:none" data-filterable-for="context-commitish-filter-field">
              <div class="no-results js-not-filterable">Nothing to show</div>
            </div>
          </div>
        </div><!-- /.commitish-context-context -->
      </div>

    </li>
  </ul>

  <ul class="subnav with-scope">

    <li><a href="/loudpixel/highcharts-rails" class="selected" highlight="repo_source">Files</a></li>
    <li><a href="/loudpixel/highcharts-rails/commits/master" highlight="repo_commits">Commits</a></li>
    <li><a href="/loudpixel/highcharts-rails/branches" class="" highlight="repo_branches" rel="nofollow">Branches <span class="counter">1</span></a></li>
  </ul>

</div>

  
  
  


          

        </div><!-- /.repohead -->

        





<!-- block_view_fragment_key: views10/v8/blob:v21:cc9f938d6a40a9eea4348e18ae28301a -->
  <div id="slider">

    <div class="breadcrumb" data-path="javascripts/excanvas.compiled.js/">
      <b itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/loudpixel/highcharts-rails/tree/dd4355a3587431608553e6cc347260fecf207239" class="js-rewrite-sha" itemprop="url"><span itemprop="title">highcharts-rails</span></a></b> / <span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/loudpixel/highcharts-rails/tree/dd4355a3587431608553e6cc347260fecf207239/javascripts" class="js-rewrite-sha" itemscope="url"><span itemprop="title">javascripts</span></a></span> / <strong class="final-path">excanvas.compiled.js</strong> <span class="js-clippy mini-icon mini-icon-clippy " data-clipboard-text="javascripts/excanvas.compiled.js" data-copied-hint="copied!" data-copy-hint="copy to clipboard"></span>
    </div>


      <div class="commit file-history-tease" data-path="javascripts/excanvas.compiled.js/">
        <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/b363c53afa5ec212eb9cca3aa30b258b?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="24" />
        <span class="author"><a href="/abbottry">abbottry</a></span>
        <time class="js-relative-date" datetime="2010-02-08T18:56:22-08:00" title="2010-02-08 18:56:22">February 08, 2010</time>
        <div class="commit-title">
            <a href="/loudpixel/highcharts-rails/commit/7b79a4c985170a9d0e62d60bac3a8516d1d57982" class="message">Added javascript scripts</a>
        </div>

        <div class="participation">
          <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
          
        </div>
        <div id="blob_contributors_box" style="display:none">
          <h2>Users on GitHub who have contributed to this file</h2>
          <ul class="facebox-user-list">
            <li>
              <img height="24" src="https://secure.gravatar.com/avatar/b363c53afa5ec212eb9cca3aa30b258b?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="24" />
              <a href="/abbottry">abbottry</a>
            </li>
          </ul>
        </div>
      </div>

    <div class="frames">
      <div class="frame frame-center" data-path="javascripts/excanvas.compiled.js/" data-permalink-url="/loudpixel/highcharts-rails/blob/dd4355a3587431608553e6cc347260fecf207239/javascripts/excanvas.compiled.js" data-title="highcharts-rails/javascripts/excanvas.compiled.js at master · loudpixel/highcharts-rails · GitHub" data-type="blob">

        <div id="files" class="bubble">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><b class="mini-icon mini-icon-text-file"></b></span>
                <span class="mode" title="File Mode">100755</span>
                  <span>36 lines (35 sloc)</span>
                <span>11.363 kb</span>
              </div>
              <ul class="button-group actions">
                  <li>
                    <a class="grouped-button file-edit-link minibutton bigger lighter js-rewrite-sha" href="/loudpixel/highcharts-rails/edit/dd4355a3587431608553e6cc347260fecf207239/javascripts/excanvas.compiled.js" data-method="post" rel="nofollow" data-hotkey="e">Edit this file</a>
                  </li>

                <li>
                  <a href="/loudpixel/highcharts-rails/raw/master/javascripts/excanvas.compiled.js" class="minibutton btn-raw grouped-button bigger lighter" id="raw-url"><span class="icon"></span>Raw</a>
                </li>
                  <li>
                    <a href="/loudpixel/highcharts-rails/blame/master/javascripts/excanvas.compiled.js" class="minibutton btn-blame grouped-button bigger lighter"><span class="icon"></span>Blame</a>
                  </li>
                <li>
                  <a href="/loudpixel/highcharts-rails/commits/master/javascripts/excanvas.compiled.js" class="minibutton btn-history grouped-button bigger lighter" rel="nofollow"><span class="icon"></span>History</a>
                </li>
              </ul>
            </div>
              <div class="data type-javascript">
      <table cellpadding="0" cellspacing="0" class="lines">
        <tr>
          <td>
            <pre class="line_numbers"><span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
</pre>
          </td>
          <td width="100%">
                <div class="highlight"><pre><div class='line' id='LC1'><span class="c1">// Copyright 2006 Google Inc.</span></div><div class='line' id='LC2'><span class="c1">//</span></div><div class='line' id='LC3'><span class="c1">// Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);</span></div><div class='line' id='LC4'><span class="c1">// you may not use this file except in compliance with the License.</span></div><div class='line' id='LC5'><span class="c1">// You may obtain a copy of the License at</span></div><div class='line' id='LC6'><span class="c1">//</span></div><div class='line' id='LC7'><span class="c1">//   http://www.apache.org/licenses/LICENSE-2.0</span></div><div class='line' id='LC8'><span class="c1">//</span></div><div class='line' id='LC9'><span class="c1">// Unless required by applicable law or agreed to in writing, software</span></div><div class='line' id='LC10'><span class="c1">// distributed under the License is distributed on an &quot;AS IS&quot; BASIS,</span></div><div class='line' id='LC11'><span class="c1">// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.</span></div><div class='line' id='LC12'><span class="c1">// See the License for the specific language governing permissions and</span></div><div class='line' id='LC13'><span class="c1">// limitations under the License.</span></div><div class='line' id='LC14'><span class="nb">document</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s2">&quot;canvas&quot;</span><span class="p">).</span><span class="nx">getContext</span><span class="o">||</span><span class="p">(</span><span class="kd">function</span><span class="p">(){</span><span class="kd">var</span> <span class="nx">s</span><span class="o">=</span><span class="nb">Math</span><span class="p">,</span><span class="nx">j</span><span class="o">=</span><span class="nx">s</span><span class="p">.</span><span class="nx">round</span><span class="p">,</span><span class="nx">F</span><span class="o">=</span><span class="nx">s</span><span class="p">.</span><span class="nx">sin</span><span class="p">,</span><span class="nx">G</span><span class="o">=</span><span class="nx">s</span><span class="p">.</span><span class="nx">cos</span><span class="p">,</span><span class="nx">V</span><span class="o">=</span><span class="nx">s</span><span class="p">.</span><span class="nx">abs</span><span class="p">,</span><span class="nx">W</span><span class="o">=</span><span class="nx">s</span><span class="p">.</span><span class="nx">sqrt</span><span class="p">,</span><span class="nx">k</span><span class="o">=</span><span class="mi">10</span><span class="p">,</span><span class="nx">v</span><span class="o">=</span><span class="nx">k</span><span class="o">/</span><span class="mi">2</span><span class="p">;</span><span class="kd">function</span> <span class="nx">X</span><span class="p">(){</span><span class="k">return</span> <span class="k">this</span><span class="p">.</span><span class="nx">context_</span><span class="o">||</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">context_</span><span class="o">=</span><span class="k">new</span> <span class="nx">H</span><span class="p">(</span><span class="k">this</span><span class="p">))}</span><span class="kd">var</span> <span class="nx">L</span><span class="o">=</span><span class="nb">Array</span><span class="p">.</span><span class="nx">prototype</span><span class="p">.</span><span class="nx">slice</span><span class="p">;</span><span class="kd">function</span> <span class="nx">Y</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="kd">var</span> <span class="nx">c</span><span class="o">=</span><span class="nx">L</span><span class="p">.</span><span class="nx">call</span><span class="p">(</span><span class="nx">arguments</span><span class="p">,</span><span class="mi">2</span><span class="p">);</span><span class="k">return</span> <span class="kd">function</span><span class="p">(){</span><span class="k">return</span> <span class="nx">b</span><span class="p">.</span><span class="nx">apply</span><span class="p">(</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">.</span><span class="nx">concat</span><span class="p">(</span><span class="nx">L</span><span class="p">.</span><span class="nx">call</span><span class="p">(</span><span class="nx">arguments</span><span class="p">)))}}</span><span class="kd">var</span> <span class="nx">M</span><span class="o">=</span><span class="p">{</span><span class="nx">init</span><span class="o">:</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="k">if</span><span class="p">(</span><span class="sr">/MSIE/</span><span class="p">.</span><span class="nx">test</span><span class="p">(</span><span class="nx">navigator</span><span class="p">.</span><span class="nx">userAgent</span><span class="p">)</span><span class="o">&amp;&amp;!</span><span class="nb">window</span><span class="p">.</span><span class="nx">opera</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="nx">b</span><span class="o">||</span><span class="nb">document</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s2">&quot;canvas&quot;</span><span class="p">);</span><span class="nx">a</span><span class="p">.</span><span class="nx">attachEvent</span><span class="p">(</span><span class="s2">&quot;onreadystatechange&quot;</span><span class="p">,</span><span class="nx">Y</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">init_</span><span class="p">,</span><span class="k">this</span><span class="p">,</span><span class="nx">a</span><span class="p">))}},</span><span class="nx">init_</span><span class="o">:</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="nx">b</span><span class="p">.</span><span class="nx">namespaces</span><span class="p">.</span><span class="nx">g_vml_</span><span class="o">||</span></div><div class='line' id='LC15'><span class="nx">b</span><span class="p">.</span><span class="nx">namespaces</span><span class="p">.</span><span class="nx">add</span><span class="p">(</span><span class="s2">&quot;g_vml_&quot;</span><span class="p">,</span><span class="s2">&quot;urn:schemas-microsoft-com:vml&quot;</span><span class="p">,</span><span class="s2">&quot;#default#VML&quot;</span><span class="p">);</span><span class="nx">b</span><span class="p">.</span><span class="nx">namespaces</span><span class="p">.</span><span class="nx">g_o_</span><span class="o">||</span><span class="nx">b</span><span class="p">.</span><span class="nx">namespaces</span><span class="p">.</span><span class="nx">add</span><span class="p">(</span><span class="s2">&quot;g_o_&quot;</span><span class="p">,</span><span class="s2">&quot;urn:schemas-microsoft-com:office:office&quot;</span><span class="p">,</span><span class="s2">&quot;#default#VML&quot;</span><span class="p">);</span><span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="nx">b</span><span class="p">.</span><span class="nx">styleSheets</span><span class="p">.</span><span class="nx">ex_canvas_</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">createStyleSheet</span><span class="p">();</span><span class="nx">a</span><span class="p">.</span><span class="nx">owningElement</span><span class="p">.</span><span class="nx">id</span><span class="o">=</span><span class="s2">&quot;ex_canvas_&quot;</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">cssText</span><span class="o">=</span><span class="s2">&quot;canvas{display:inline-block;overflow:hidden;text-align:left;width:300px;height:150px}g_vml_\\:*{behavior:url(#default#VML)}g_o_\\:*{behavior:url(#default#VML)}&quot;</span><span class="p">}</span><span class="kd">var</span> <span class="nx">c</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">getElementsByTagName</span><span class="p">(</span><span class="s2">&quot;canvas&quot;</span><span class="p">),</span><span class="nx">d</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">d</span><span class="o">&lt;</span><span class="nx">c</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span><span class="nx">d</span><span class="o">++</span><span class="p">)</span><span class="k">this</span><span class="p">.</span><span class="nx">initElement</span><span class="p">(</span><span class="nx">c</span><span class="p">[</span><span class="nx">d</span><span class="p">])},</span></div><div class='line' id='LC16'><span class="nx">initElement</span><span class="o">:</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="nx">b</span><span class="p">.</span><span class="nx">getContext</span><span class="p">){</span><span class="nx">b</span><span class="p">.</span><span class="nx">getContext</span><span class="o">=</span><span class="nx">X</span><span class="p">;</span><span class="nx">b</span><span class="p">.</span><span class="nx">innerHTML</span><span class="o">=</span><span class="s2">&quot;&quot;</span><span class="p">;</span><span class="nx">b</span><span class="p">.</span><span class="nx">attachEvent</span><span class="p">(</span><span class="s2">&quot;onpropertychange&quot;</span><span class="p">,</span><span class="nx">Z</span><span class="p">);</span><span class="nx">b</span><span class="p">.</span><span class="nx">attachEvent</span><span class="p">(</span><span class="s2">&quot;onresize&quot;</span><span class="p">,</span><span class="nx">$</span><span class="p">);</span><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">attributes</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">a</span><span class="p">.</span><span class="nx">width</span><span class="o">&amp;&amp;</span><span class="nx">a</span><span class="p">.</span><span class="nx">width</span><span class="p">.</span><span class="nx">specified</span><span class="p">)</span><span class="nx">b</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">width</span><span class="o">=</span><span class="nx">a</span><span class="p">.</span><span class="nx">width</span><span class="p">.</span><span class="nx">nodeValue</span><span class="o">+</span><span class="s2">&quot;px&quot;</span><span class="p">;</span><span class="k">else</span> <span class="nx">b</span><span class="p">.</span><span class="nx">width</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">clientWidth</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">a</span><span class="p">.</span><span class="nx">height</span><span class="o">&amp;&amp;</span><span class="nx">a</span><span class="p">.</span><span class="nx">height</span><span class="p">.</span><span class="nx">specified</span><span class="p">)</span><span class="nx">b</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">height</span><span class="o">=</span><span class="nx">a</span><span class="p">.</span><span class="nx">height</span><span class="p">.</span><span class="nx">nodeValue</span><span class="o">+</span><span class="s2">&quot;px&quot;</span><span class="p">;</span><span class="k">else</span> <span class="nx">b</span><span class="p">.</span><span class="nx">height</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">clientHeight</span><span class="p">}</span><span class="k">return</span> <span class="nx">b</span><span class="p">}};</span><span class="kd">function</span> <span class="nx">Z</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">srcElement</span><span class="p">;</span><span class="k">switch</span><span class="p">(</span><span class="nx">b</span><span class="p">.</span><span class="nx">propertyName</span><span class="p">){</span><span class="k">case</span> <span class="s2">&quot;width&quot;</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">width</span><span class="o">=</span><span class="nx">a</span><span class="p">.</span><span class="nx">attributes</span><span class="p">.</span><span class="nx">width</span><span class="p">.</span><span class="nx">nodeValue</span><span class="o">+</span><span class="s2">&quot;px&quot;</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">getContext</span><span class="p">().</span><span class="nx">clearRect</span><span class="p">();</span></div><div class='line' id='LC17'><span class="k">break</span><span class="p">;</span><span class="k">case</span> <span class="s2">&quot;height&quot;</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">height</span><span class="o">=</span><span class="nx">a</span><span class="p">.</span><span class="nx">attributes</span><span class="p">.</span><span class="nx">height</span><span class="p">.</span><span class="nx">nodeValue</span><span class="o">+</span><span class="s2">&quot;px&quot;</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">getContext</span><span class="p">().</span><span class="nx">clearRect</span><span class="p">();</span><span class="k">break</span><span class="p">}}</span><span class="kd">function</span> <span class="nx">$</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">srcElement</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">a</span><span class="p">.</span><span class="nx">firstChild</span><span class="p">){</span><span class="nx">a</span><span class="p">.</span><span class="nx">firstChild</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">width</span><span class="o">=</span><span class="nx">a</span><span class="p">.</span><span class="nx">clientWidth</span><span class="o">+</span><span class="s2">&quot;px&quot;</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">firstChild</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">height</span><span class="o">=</span><span class="nx">a</span><span class="p">.</span><span class="nx">clientHeight</span><span class="o">+</span><span class="s2">&quot;px&quot;</span><span class="p">}}</span><span class="nx">M</span><span class="p">.</span><span class="nx">init</span><span class="p">();</span><span class="kd">var</span> <span class="nx">N</span><span class="o">=</span><span class="p">[],</span><span class="nx">B</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">B</span><span class="o">&lt;</span><span class="mi">16</span><span class="p">;</span><span class="nx">B</span><span class="o">++</span><span class="p">){</span><span class="kd">var</span> <span class="nx">C</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">C</span><span class="o">&lt;</span><span class="mi">16</span><span class="p">;</span><span class="nx">C</span><span class="o">++</span><span class="p">)</span><span class="nx">N</span><span class="p">[</span><span class="nx">B</span><span class="o">*</span><span class="mi">16</span><span class="o">+</span><span class="nx">C</span><span class="p">]</span><span class="o">=</span><span class="nx">B</span><span class="p">.</span><span class="nx">toString</span><span class="p">(</span><span class="mi">16</span><span class="p">)</span><span class="o">+</span><span class="nx">C</span><span class="p">.</span><span class="nx">toString</span><span class="p">(</span><span class="mi">16</span><span class="p">)}</span><span class="kd">function</span> <span class="nx">I</span><span class="p">(){</span><span class="k">return</span><span class="p">[[</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">]]}</span><span class="kd">function</span> <span class="nx">y</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="kd">var</span> <span class="nx">c</span><span class="o">=</span><span class="nx">I</span><span class="p">(),</span><span class="nx">d</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">d</span><span class="o">&lt;</span><span class="mi">3</span><span class="p">;</span><span class="nx">d</span><span class="o">++</span><span class="p">){</span><span class="kd">var</span> <span class="nx">f</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">f</span><span class="o">&lt;</span><span class="mi">3</span><span class="p">;</span><span class="nx">f</span><span class="o">++</span><span class="p">){</span><span class="kd">var</span> <span class="nx">h</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span><span class="nx">g</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">g</span><span class="o">&lt;</span><span class="mi">3</span><span class="p">;</span><span class="nx">g</span><span class="o">++</span><span class="p">)</span><span class="nx">h</span><span class="o">+=</span><span class="nx">b</span><span class="p">[</span><span class="nx">d</span><span class="p">][</span><span class="nx">g</span><span class="p">]</span><span class="o">*</span><span class="nx">a</span><span class="p">[</span><span class="nx">g</span><span class="p">][</span><span class="nx">f</span><span class="p">];</span><span class="nx">c</span><span class="p">[</span><span class="nx">d</span><span class="p">][</span><span class="nx">f</span><span class="p">]</span><span class="o">=</span></div><div class='line' id='LC18'><span class="nx">h</span><span class="p">}}</span><span class="k">return</span> <span class="nx">c</span><span class="p">}</span><span class="kd">function</span> <span class="nx">O</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="nx">a</span><span class="p">.</span><span class="nx">fillStyle</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">fillStyle</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">lineCap</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">lineCap</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">lineJoin</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">lineJoin</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">lineWidth</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">lineWidth</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">miterLimit</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">miterLimit</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">shadowBlur</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">shadowBlur</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">shadowColor</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">shadowColor</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">shadowOffsetX</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">shadowOffsetX</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">shadowOffsetY</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">shadowOffsetY</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">strokeStyle</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">strokeStyle</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">globalAlpha</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">globalAlpha</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">lineScale_</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">lineScale_</span><span class="p">}</span><span class="kd">function</span> <span class="nx">P</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="o">=</span><span class="mi">1</span><span class="p">;</span><span class="nx">b</span><span class="o">=</span><span class="nb">String</span><span class="p">(</span><span class="nx">b</span><span class="p">);</span><span class="k">if</span><span class="p">(</span><span class="nx">b</span><span class="p">.</span><span class="nx">substring</span><span class="p">(</span><span class="mi">0</span><span class="p">,</span><span class="mi">3</span><span class="p">)</span><span class="o">==</span><span class="s2">&quot;rgb&quot;</span><span class="p">){</span><span class="kd">var</span> <span class="nx">d</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">indexOf</span><span class="p">(</span><span class="s2">&quot;(&quot;</span><span class="p">,</span><span class="mi">3</span><span class="p">),</span><span class="nx">f</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">indexOf</span><span class="p">(</span><span class="s2">&quot;)&quot;</span><span class="p">,</span><span class="nx">d</span><span class="o">+</span></div><div class='line' id='LC19'><span class="mi">1</span><span class="p">),</span><span class="nx">h</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">substring</span><span class="p">(</span><span class="nx">d</span><span class="o">+</span><span class="mi">1</span><span class="p">,</span><span class="nx">f</span><span class="p">).</span><span class="nx">split</span><span class="p">(</span><span class="s2">&quot;,&quot;</span><span class="p">);</span><span class="nx">a</span><span class="o">=</span><span class="s2">&quot;#&quot;</span><span class="p">;</span><span class="kd">var</span> <span class="nx">g</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">g</span><span class="o">&lt;</span><span class="mi">3</span><span class="p">;</span><span class="nx">g</span><span class="o">++</span><span class="p">)</span><span class="nx">a</span><span class="o">+=</span><span class="nx">N</span><span class="p">[</span><span class="nb">Number</span><span class="p">(</span><span class="nx">h</span><span class="p">[</span><span class="nx">g</span><span class="p">])];</span><span class="k">if</span><span class="p">(</span><span class="nx">h</span><span class="p">.</span><span class="nx">length</span><span class="o">==</span><span class="mi">4</span><span class="o">&amp;&amp;</span><span class="nx">b</span><span class="p">.</span><span class="nx">substr</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="mi">1</span><span class="p">)</span><span class="o">==</span><span class="s2">&quot;a&quot;</span><span class="p">)</span><span class="nx">c</span><span class="o">=</span><span class="nx">h</span><span class="p">[</span><span class="mi">3</span><span class="p">]}</span><span class="k">else</span> <span class="nx">a</span><span class="o">=</span><span class="nx">b</span><span class="p">;</span><span class="k">return</span><span class="p">{</span><span class="nx">color</span><span class="o">:</span><span class="nx">a</span><span class="p">,</span><span class="nx">alpha</span><span class="o">:</span><span class="nx">c</span><span class="p">}}</span><span class="kd">function</span> <span class="nx">aa</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="k">switch</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="k">case</span> <span class="s2">&quot;butt&quot;</span><span class="o">:</span><span class="k">return</span><span class="s2">&quot;flat&quot;</span><span class="p">;</span><span class="k">case</span> <span class="s2">&quot;round&quot;</span><span class="o">:</span><span class="k">return</span><span class="s2">&quot;round&quot;</span><span class="p">;</span><span class="k">case</span> <span class="s2">&quot;square&quot;</span><span class="o">:</span><span class="k">default</span><span class="o">:</span><span class="k">return</span><span class="s2">&quot;square&quot;</span><span class="p">}}</span><span class="kd">function</span> <span class="nx">H</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="o">=</span><span class="nx">I</span><span class="p">();</span><span class="k">this</span><span class="p">.</span><span class="nx">mStack_</span><span class="o">=</span><span class="p">[];</span><span class="k">this</span><span class="p">.</span><span class="nx">aStack_</span><span class="o">=</span><span class="p">[];</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="o">=</span><span class="p">[];</span><span class="k">this</span><span class="p">.</span><span class="nx">fillStyle</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">strokeStyle</span><span class="o">=</span><span class="s2">&quot;#000&quot;</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">lineWidth</span><span class="o">=</span><span class="mi">1</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">lineJoin</span><span class="o">=</span><span class="s2">&quot;miter&quot;</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">lineCap</span><span class="o">=</span><span class="s2">&quot;butt&quot;</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">miterLimit</span><span class="o">=</span><span class="nx">k</span><span class="o">*</span><span class="mi">1</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">globalAlpha</span><span class="o">=</span><span class="mi">1</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">canvas</span><span class="o">=</span><span class="nx">b</span><span class="p">;</span></div><div class='line' id='LC20'><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">ownerDocument</span><span class="p">.</span><span class="nx">createElement</span><span class="p">(</span><span class="s2">&quot;div&quot;</span><span class="p">);</span><span class="nx">a</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">width</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">clientWidth</span><span class="o">+</span><span class="s2">&quot;px&quot;</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">height</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">clientHeight</span><span class="o">+</span><span class="s2">&quot;px&quot;</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">overflow</span><span class="o">=</span><span class="s2">&quot;hidden&quot;</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">position</span><span class="o">=</span><span class="s2">&quot;absolute&quot;</span><span class="p">;</span><span class="nx">b</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">element_</span><span class="o">=</span><span class="nx">a</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">lineScale_</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="o">=</span><span class="mi">1</span><span class="p">}</span><span class="kd">var</span> <span class="nx">i</span><span class="o">=</span><span class="nx">H</span><span class="p">.</span><span class="nx">prototype</span><span class="p">;</span><span class="nx">i</span><span class="p">.</span><span class="nx">clearRect</span><span class="o">=</span><span class="kd">function</span><span class="p">(){</span><span class="k">this</span><span class="p">.</span><span class="nx">element_</span><span class="p">.</span><span class="nx">innerHTML</span><span class="o">=</span><span class="s2">&quot;&quot;</span><span class="p">};</span><span class="nx">i</span><span class="p">.</span><span class="nx">beginPath</span><span class="o">=</span><span class="kd">function</span><span class="p">(){</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="o">=</span><span class="p">[]};</span><span class="nx">i</span><span class="p">.</span><span class="nx">moveTo</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="kd">var</span> <span class="nx">c</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">.</span><span class="nx">push</span><span class="p">({</span><span class="nx">type</span><span class="o">:</span><span class="s2">&quot;moveTo&quot;</span><span class="p">,</span><span class="nx">x</span><span class="o">:</span><span class="nx">c</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="nx">c</span><span class="p">.</span><span class="nx">y</span><span class="p">});</span><span class="k">this</span><span class="p">.</span><span class="nx">currentX_</span><span class="o">=</span><span class="nx">c</span><span class="p">.</span><span class="nx">x</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">currentY_</span><span class="o">=</span><span class="nx">c</span><span class="p">.</span><span class="nx">y</span><span class="p">};</span></div><div class='line' id='LC21'><span class="nx">i</span><span class="p">.</span><span class="nx">lineTo</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="kd">var</span> <span class="nx">c</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">.</span><span class="nx">push</span><span class="p">({</span><span class="nx">type</span><span class="o">:</span><span class="s2">&quot;lineTo&quot;</span><span class="p">,</span><span class="nx">x</span><span class="o">:</span><span class="nx">c</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="nx">c</span><span class="p">.</span><span class="nx">y</span><span class="p">});</span><span class="k">this</span><span class="p">.</span><span class="nx">currentX_</span><span class="o">=</span><span class="nx">c</span><span class="p">.</span><span class="nx">x</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">currentY_</span><span class="o">=</span><span class="nx">c</span><span class="p">.</span><span class="nx">y</span><span class="p">};</span><span class="nx">i</span><span class="p">.</span><span class="nx">bezierCurveTo</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">){</span><span class="kd">var</span> <span class="nx">g</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">),</span><span class="nx">l</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">),</span><span class="nx">e</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">);</span><span class="nx">Q</span><span class="p">(</span><span class="k">this</span><span class="p">,</span><span class="nx">l</span><span class="p">,</span><span class="nx">e</span><span class="p">,</span><span class="nx">g</span><span class="p">)};</span><span class="kd">function</span> <span class="nx">Q</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">){</span><span class="nx">b</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">.</span><span class="nx">push</span><span class="p">({</span><span class="nx">type</span><span class="o">:</span><span class="s2">&quot;bezierCurveTo&quot;</span><span class="p">,</span><span class="nx">cp1x</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">cp1y</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span><span class="nx">cp2x</span><span class="o">:</span><span class="nx">c</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">cp2y</span><span class="o">:</span><span class="nx">c</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span><span class="nx">x</span><span class="o">:</span><span class="nx">d</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="nx">d</span><span class="p">.</span><span class="nx">y</span><span class="p">});</span><span class="nx">b</span><span class="p">.</span><span class="nx">currentX_</span><span class="o">=</span><span class="nx">d</span><span class="p">.</span><span class="nx">x</span><span class="p">;</span><span class="nx">b</span><span class="p">.</span><span class="nx">currentY_</span><span class="o">=</span><span class="nx">d</span><span class="p">.</span><span class="nx">y</span><span class="p">}</span><span class="nx">i</span><span class="p">.</span><span class="nx">quadraticCurveTo</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">){</span><span class="kd">var</span> <span class="nx">f</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">),</span><span class="nx">h</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">),</span><span class="nx">g</span><span class="o">=</span><span class="p">{</span><span class="nx">x</span><span class="o">:</span><span class="k">this</span><span class="p">.</span><span class="nx">currentX_</span><span class="o">+</span></div><div class='line' id='LC22'><span class="mf">0.6666666666666666</span><span class="o">*</span><span class="p">(</span><span class="nx">f</span><span class="p">.</span><span class="nx">x</span><span class="o">-</span><span class="k">this</span><span class="p">.</span><span class="nx">currentX_</span><span class="p">),</span><span class="nx">y</span><span class="o">:</span><span class="k">this</span><span class="p">.</span><span class="nx">currentY_</span><span class="o">+</span><span class="mf">0.6666666666666666</span><span class="o">*</span><span class="p">(</span><span class="nx">f</span><span class="p">.</span><span class="nx">y</span><span class="o">-</span><span class="k">this</span><span class="p">.</span><span class="nx">currentY_</span><span class="p">)};</span><span class="nx">Q</span><span class="p">(</span><span class="k">this</span><span class="p">,</span><span class="nx">g</span><span class="p">,{</span><span class="nx">x</span><span class="o">:</span><span class="nx">g</span><span class="p">.</span><span class="nx">x</span><span class="o">+</span><span class="p">(</span><span class="nx">h</span><span class="p">.</span><span class="nx">x</span><span class="o">-</span><span class="k">this</span><span class="p">.</span><span class="nx">currentX_</span><span class="p">)</span><span class="o">/</span><span class="mi">3</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="nx">g</span><span class="p">.</span><span class="nx">y</span><span class="o">+</span><span class="p">(</span><span class="nx">h</span><span class="p">.</span><span class="nx">y</span><span class="o">-</span><span class="k">this</span><span class="p">.</span><span class="nx">currentY_</span><span class="p">)</span><span class="o">/</span><span class="mi">3</span><span class="p">},</span><span class="nx">h</span><span class="p">)};</span><span class="nx">i</span><span class="p">.</span><span class="nx">arc</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">){</span><span class="nx">c</span><span class="o">*=</span><span class="nx">k</span><span class="p">;</span><span class="kd">var</span> <span class="nx">g</span><span class="o">=</span><span class="nx">h</span><span class="o">?</span><span class="s2">&quot;at&quot;</span><span class="o">:</span><span class="s2">&quot;wa&quot;</span><span class="p">,</span><span class="nx">l</span><span class="o">=</span><span class="nx">b</span><span class="o">+</span><span class="nx">G</span><span class="p">(</span><span class="nx">d</span><span class="p">)</span><span class="o">*</span><span class="nx">c</span><span class="o">-</span><span class="nx">v</span><span class="p">,</span><span class="nx">e</span><span class="o">=</span><span class="nx">a</span><span class="o">+</span><span class="nx">F</span><span class="p">(</span><span class="nx">d</span><span class="p">)</span><span class="o">*</span><span class="nx">c</span><span class="o">-</span><span class="nx">v</span><span class="p">,</span><span class="nx">m</span><span class="o">=</span><span class="nx">b</span><span class="o">+</span><span class="nx">G</span><span class="p">(</span><span class="nx">f</span><span class="p">)</span><span class="o">*</span><span class="nx">c</span><span class="o">-</span><span class="nx">v</span><span class="p">,</span><span class="nx">r</span><span class="o">=</span><span class="nx">a</span><span class="o">+</span><span class="nx">F</span><span class="p">(</span><span class="nx">f</span><span class="p">)</span><span class="o">*</span><span class="nx">c</span><span class="o">-</span><span class="nx">v</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">l</span><span class="o">==</span><span class="nx">m</span><span class="o">&amp;&amp;!</span><span class="nx">h</span><span class="p">)</span><span class="nx">l</span><span class="o">+=</span><span class="mf">0.125</span><span class="p">;</span><span class="kd">var</span> <span class="nx">n</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">),</span><span class="nx">o</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">l</span><span class="p">,</span><span class="nx">e</span><span class="p">),</span><span class="nx">q</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">m</span><span class="p">,</span><span class="nx">r</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">.</span><span class="nx">push</span><span class="p">({</span><span class="nx">type</span><span class="o">:</span><span class="nx">g</span><span class="p">,</span><span class="nx">x</span><span class="o">:</span><span class="nx">n</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="nx">n</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span><span class="nx">radius</span><span class="o">:</span><span class="nx">c</span><span class="p">,</span><span class="nx">xStart</span><span class="o">:</span><span class="nx">o</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">yStart</span><span class="o">:</span><span class="nx">o</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span><span class="nx">xEnd</span><span class="o">:</span><span class="nx">q</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">yEnd</span><span class="o">:</span><span class="nx">q</span><span class="p">.</span><span class="nx">y</span><span class="p">})};</span><span class="nx">i</span><span class="p">.</span><span class="nx">rect</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">){</span><span class="k">this</span><span class="p">.</span><span class="nx">moveTo</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span></div><div class='line' id='LC23'><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="o">+</span><span class="nx">c</span><span class="p">,</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="o">+</span><span class="nx">c</span><span class="p">,</span><span class="nx">a</span><span class="o">+</span><span class="nx">d</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="o">+</span><span class="nx">d</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">closePath</span><span class="p">()};</span><span class="nx">i</span><span class="p">.</span><span class="nx">strokeRect</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">){</span><span class="kd">var</span> <span class="nx">f</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">beginPath</span><span class="p">();</span><span class="k">this</span><span class="p">.</span><span class="nx">moveTo</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="o">+</span><span class="nx">c</span><span class="p">,</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="o">+</span><span class="nx">c</span><span class="p">,</span><span class="nx">a</span><span class="o">+</span><span class="nx">d</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="o">+</span><span class="nx">d</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">closePath</span><span class="p">();</span><span class="k">this</span><span class="p">.</span><span class="nx">stroke</span><span class="p">();</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="o">=</span><span class="nx">f</span><span class="p">};</span><span class="nx">i</span><span class="p">.</span><span class="nx">fillRect</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">){</span><span class="kd">var</span> <span class="nx">f</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">beginPath</span><span class="p">();</span><span class="k">this</span><span class="p">.</span><span class="nx">moveTo</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="o">+</span><span class="nx">c</span><span class="p">,</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="o">+</span><span class="nx">c</span><span class="p">,</span><span class="nx">a</span><span class="o">+</span><span class="nx">d</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">lineTo</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="o">+</span><span class="nx">d</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">closePath</span><span class="p">();</span><span class="k">this</span><span class="p">.</span><span class="nx">fill</span><span class="p">();</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="o">=</span><span class="nx">f</span><span class="p">};</span><span class="nx">i</span><span class="p">.</span><span class="nx">createLinearGradient</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span></div><div class='line' id='LC24'><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">){</span><span class="kd">var</span> <span class="nx">f</span><span class="o">=</span><span class="k">new</span> <span class="nx">D</span><span class="p">(</span><span class="s2">&quot;gradient&quot;</span><span class="p">);</span><span class="nx">f</span><span class="p">.</span><span class="nx">x0_</span><span class="o">=</span><span class="nx">b</span><span class="p">;</span><span class="nx">f</span><span class="p">.</span><span class="nx">y0_</span><span class="o">=</span><span class="nx">a</span><span class="p">;</span><span class="nx">f</span><span class="p">.</span><span class="nx">x1_</span><span class="o">=</span><span class="nx">c</span><span class="p">;</span><span class="nx">f</span><span class="p">.</span><span class="nx">y1_</span><span class="o">=</span><span class="nx">d</span><span class="p">;</span><span class="k">return</span> <span class="nx">f</span><span class="p">};</span><span class="nx">i</span><span class="p">.</span><span class="nx">createRadialGradient</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">){</span><span class="kd">var</span> <span class="nx">g</span><span class="o">=</span><span class="k">new</span> <span class="nx">D</span><span class="p">(</span><span class="s2">&quot;gradientradial&quot;</span><span class="p">);</span><span class="nx">g</span><span class="p">.</span><span class="nx">x0_</span><span class="o">=</span><span class="nx">b</span><span class="p">;</span><span class="nx">g</span><span class="p">.</span><span class="nx">y0_</span><span class="o">=</span><span class="nx">a</span><span class="p">;</span><span class="nx">g</span><span class="p">.</span><span class="nx">r0_</span><span class="o">=</span><span class="nx">c</span><span class="p">;</span><span class="nx">g</span><span class="p">.</span><span class="nx">x1_</span><span class="o">=</span><span class="nx">d</span><span class="p">;</span><span class="nx">g</span><span class="p">.</span><span class="nx">y1_</span><span class="o">=</span><span class="nx">f</span><span class="p">;</span><span class="nx">g</span><span class="p">.</span><span class="nx">r1_</span><span class="o">=</span><span class="nx">h</span><span class="p">;</span><span class="k">return</span> <span class="nx">g</span><span class="p">};</span><span class="nx">i</span><span class="p">.</span><span class="nx">drawImage</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">,</span><span class="nx">g</span><span class="p">,</span><span class="nx">l</span><span class="p">,</span><span class="nx">e</span><span class="p">,</span><span class="nx">m</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">runtimeStyle</span><span class="p">.</span><span class="nx">width</span><span class="p">,</span><span class="nx">r</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">runtimeStyle</span><span class="p">.</span><span class="nx">height</span><span class="p">;</span><span class="nx">b</span><span class="p">.</span><span class="nx">runtimeStyle</span><span class="p">.</span><span class="nx">width</span><span class="o">=</span><span class="s2">&quot;auto&quot;</span><span class="p">;</span><span class="nx">b</span><span class="p">.</span><span class="nx">runtimeStyle</span><span class="p">.</span><span class="nx">height</span><span class="o">=</span><span class="s2">&quot;auto&quot;</span><span class="p">;</span><span class="kd">var</span> <span class="nx">n</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">width</span><span class="p">,</span><span class="nx">o</span><span class="o">=</span><span class="nx">b</span><span class="p">.</span><span class="nx">height</span><span class="p">;</span><span class="nx">b</span><span class="p">.</span><span class="nx">runtimeStyle</span><span class="p">.</span><span class="nx">width</span><span class="o">=</span><span class="nx">m</span><span class="p">;</span><span class="nx">b</span><span class="p">.</span><span class="nx">runtimeStyle</span><span class="p">.</span><span class="nx">height</span><span class="o">=</span><span class="nx">r</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">arguments</span><span class="p">.</span><span class="nx">length</span><span class="o">==</span><span class="mi">3</span><span class="p">){</span><span class="nx">a</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">1</span><span class="p">];</span><span class="nx">c</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">2</span><span class="p">];</span><span class="nx">h</span><span class="o">=</span><span class="nx">g</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="nx">l</span><span class="o">=</span><span class="nx">d</span><span class="o">=</span><span class="nx">n</span><span class="p">;</span><span class="nx">e</span><span class="o">=</span><span class="nx">f</span><span class="o">=</span><span class="nx">o</span><span class="p">}</span><span class="k">else</span> <span class="k">if</span><span class="p">(</span><span class="nx">arguments</span><span class="p">.</span><span class="nx">length</span><span class="o">==</span></div><div class='line' id='LC25'><span class="mi">5</span><span class="p">){</span><span class="nx">a</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">1</span><span class="p">];</span><span class="nx">c</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">2</span><span class="p">];</span><span class="nx">d</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">3</span><span class="p">];</span><span class="nx">f</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">4</span><span class="p">];</span><span class="nx">h</span><span class="o">=</span><span class="nx">g</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="nx">l</span><span class="o">=</span><span class="nx">n</span><span class="p">;</span><span class="nx">e</span><span class="o">=</span><span class="nx">o</span><span class="p">}</span><span class="k">else</span> <span class="k">if</span><span class="p">(</span><span class="nx">arguments</span><span class="p">.</span><span class="nx">length</span><span class="o">==</span><span class="mi">9</span><span class="p">){</span><span class="nx">h</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">1</span><span class="p">];</span><span class="nx">g</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">2</span><span class="p">];</span><span class="nx">l</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">3</span><span class="p">];</span><span class="nx">e</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">4</span><span class="p">];</span><span class="nx">a</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">5</span><span class="p">];</span><span class="nx">c</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">6</span><span class="p">];</span><span class="nx">d</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">7</span><span class="p">];</span><span class="nx">f</span><span class="o">=</span><span class="nx">arguments</span><span class="p">[</span><span class="mi">8</span><span class="p">]}</span><span class="k">else</span> <span class="k">throw</span> <span class="nb">Error</span><span class="p">(</span><span class="s2">&quot;Invalid number of arguments&quot;</span><span class="p">);</span><span class="kd">var</span> <span class="nx">q</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">),</span><span class="nx">t</span><span class="o">=</span><span class="p">[];</span><span class="nx">t</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot; &lt;g_vml_:group&quot;</span><span class="p">,</span><span class="s1">&#39; coordsize=&quot;&#39;</span><span class="p">,</span><span class="nx">k</span><span class="o">*</span><span class="mi">10</span><span class="p">,</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">k</span><span class="o">*</span><span class="mi">10</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; coordorigin=&quot;0,0&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; style=&quot;width:&#39;</span><span class="p">,</span><span class="mi">10</span><span class="p">,</span><span class="s2">&quot;px;height:&quot;</span><span class="p">,</span><span class="mi">10</span><span class="p">,</span><span class="s2">&quot;px;position:absolute;&quot;</span><span class="p">);</span><span class="k">if</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">[</span><span class="mi">0</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span><span class="o">!=</span><span class="mi">1</span><span class="o">||</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">[</span><span class="mi">0</span><span class="p">][</span><span class="mi">1</span><span class="p">]){</span><span class="kd">var</span> <span class="nx">E</span><span class="o">=</span><span class="p">[];</span><span class="nx">E</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot;M11=&quot;</span><span class="p">,</span></div><div class='line' id='LC26'><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">[</span><span class="mi">0</span><span class="p">][</span><span class="mi">0</span><span class="p">],</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="s2">&quot;M12=&quot;</span><span class="p">,</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">[</span><span class="mi">1</span><span class="p">][</span><span class="mi">0</span><span class="p">],</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="s2">&quot;M21=&quot;</span><span class="p">,</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">[</span><span class="mi">0</span><span class="p">][</span><span class="mi">1</span><span class="p">],</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="s2">&quot;M22=&quot;</span><span class="p">,</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">[</span><span class="mi">1</span><span class="p">][</span><span class="mi">1</span><span class="p">],</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="s2">&quot;Dx=&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">q</span><span class="p">.</span><span class="nx">x</span><span class="o">/</span><span class="nx">k</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="s2">&quot;Dy=&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">q</span><span class="p">.</span><span class="nx">y</span><span class="o">/</span><span class="nx">k</span><span class="p">),</span><span class="s2">&quot;&quot;</span><span class="p">);</span><span class="kd">var</span> <span class="nx">p</span><span class="o">=</span><span class="nx">q</span><span class="p">,</span><span class="nx">z</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">a</span><span class="o">+</span><span class="nx">d</span><span class="p">,</span><span class="nx">c</span><span class="p">),</span><span class="nx">w</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="o">+</span><span class="nx">f</span><span class="p">),</span><span class="nx">x</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">a</span><span class="o">+</span><span class="nx">d</span><span class="p">,</span><span class="nx">c</span><span class="o">+</span><span class="nx">f</span><span class="p">);</span><span class="nx">p</span><span class="p">.</span><span class="nx">x</span><span class="o">=</span><span class="nx">s</span><span class="p">.</span><span class="nx">max</span><span class="p">(</span><span class="nx">p</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">z</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">w</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">x</span><span class="p">.</span><span class="nx">x</span><span class="p">);</span><span class="nx">p</span><span class="p">.</span><span class="nx">y</span><span class="o">=</span><span class="nx">s</span><span class="p">.</span><span class="nx">max</span><span class="p">(</span><span class="nx">p</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span><span class="nx">z</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span><span class="nx">w</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span><span class="nx">x</span><span class="p">.</span><span class="nx">y</span><span class="p">);</span><span class="nx">t</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot;padding:0 &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">p</span><span class="p">.</span><span class="nx">x</span><span class="o">/</span><span class="nx">k</span><span class="p">),</span><span class="s2">&quot;px &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">p</span><span class="p">.</span><span class="nx">y</span><span class="o">/</span><span class="nx">k</span><span class="p">),</span><span class="s2">&quot;px 0;filter:progid:DXImageTransform.Microsoft.Matrix(&quot;</span><span class="p">,</span><span class="nx">E</span><span class="p">.</span><span class="nx">join</span><span class="p">(</span><span class="s2">&quot;&quot;</span><span class="p">),</span><span class="s2">&quot;, sizingmethod=&#39;clip&#39;);&quot;</span><span class="p">)}</span><span class="k">else</span> <span class="nx">t</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot;top:&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">q</span><span class="p">.</span><span class="nx">y</span><span class="o">/</span><span class="nx">k</span><span class="p">),</span><span class="s2">&quot;px;left:&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">q</span><span class="p">.</span><span class="nx">x</span><span class="o">/</span><span class="nx">k</span><span class="p">),</span><span class="s2">&quot;px;&quot;</span><span class="p">);</span><span class="nx">t</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s1">&#39; &quot;&gt;&#39;</span><span class="p">,</span><span class="s1">&#39;&lt;g_vml_:image src=&quot;&#39;</span><span class="p">,</span><span class="nx">b</span><span class="p">.</span><span class="nx">src</span><span class="p">,</span></div><div class='line' id='LC27'><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; style=&quot;width:&#39;</span><span class="p">,</span><span class="nx">k</span><span class="o">*</span><span class="nx">d</span><span class="p">,</span><span class="s2">&quot;px;&quot;</span><span class="p">,</span><span class="s2">&quot; height:&quot;</span><span class="p">,</span><span class="nx">k</span><span class="o">*</span><span class="nx">f</span><span class="p">,</span><span class="s1">&#39;px;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; cropleft=&quot;&#39;</span><span class="p">,</span><span class="nx">h</span><span class="o">/</span><span class="nx">n</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; croptop=&quot;&#39;</span><span class="p">,</span><span class="nx">g</span><span class="o">/</span><span class="nx">o</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; cropright=&quot;&#39;</span><span class="p">,(</span><span class="nx">n</span><span class="o">-</span><span class="nx">h</span><span class="o">-</span><span class="nx">l</span><span class="p">)</span><span class="o">/</span><span class="nx">n</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; cropbottom=&quot;&#39;</span><span class="p">,(</span><span class="nx">o</span><span class="o">-</span><span class="nx">g</span><span class="o">-</span><span class="nx">e</span><span class="p">)</span><span class="o">/</span><span class="nx">o</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s2">&quot; /&gt;&quot;</span><span class="p">,</span><span class="s2">&quot;&lt;/g_vml_:group&gt;&quot;</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">element_</span><span class="p">.</span><span class="nx">insertAdjacentHTML</span><span class="p">(</span><span class="s2">&quot;BeforeEnd&quot;</span><span class="p">,</span><span class="nx">t</span><span class="p">.</span><span class="nx">join</span><span class="p">(</span><span class="s2">&quot;&quot;</span><span class="p">))};</span><span class="nx">i</span><span class="p">.</span><span class="nx">stroke</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="p">[],</span><span class="nx">c</span><span class="o">=</span><span class="nx">P</span><span class="p">(</span><span class="nx">b</span><span class="o">?</span><span class="k">this</span><span class="p">.</span><span class="nx">fillStyle</span><span class="o">:</span><span class="k">this</span><span class="p">.</span><span class="nx">strokeStyle</span><span class="p">),</span><span class="nx">d</span><span class="o">=</span><span class="nx">c</span><span class="p">.</span><span class="nx">color</span><span class="p">,</span><span class="nx">f</span><span class="o">=</span><span class="nx">c</span><span class="p">.</span><span class="nx">alpha</span><span class="o">*</span><span class="k">this</span><span class="p">.</span><span class="nx">globalAlpha</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot;&lt;g_vml_:shape&quot;</span><span class="p">,</span><span class="s1">&#39; filled=&quot;&#39;</span><span class="p">,</span><span class="o">!!</span><span class="nx">b</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; style=&quot;position:absolute;width:&#39;</span><span class="p">,</span><span class="mi">10</span><span class="p">,</span><span class="s2">&quot;px;height:&quot;</span><span class="p">,</span><span class="mi">10</span><span class="p">,</span><span class="s1">&#39;px;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; coordorigin=&quot;0 0&quot; coordsize=&quot;&#39;</span><span class="p">,</span><span class="nx">k</span><span class="o">*</span><span class="mi">10</span><span class="p">,</span><span class="s2">&quot; &quot;</span><span class="p">,</span><span class="nx">k</span><span class="o">*</span><span class="mi">10</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; stroked=&quot;&#39;</span><span class="p">,</span></div><div class='line' id='LC28'><span class="o">!</span><span class="nx">b</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; path=&quot;&#39;</span><span class="p">);</span><span class="kd">var</span> <span class="nx">h</span><span class="o">=</span><span class="p">{</span><span class="nx">x</span><span class="o">:</span><span class="kc">null</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="kc">null</span><span class="p">},</span><span class="nx">g</span><span class="o">=</span><span class="p">{</span><span class="nx">x</span><span class="o">:</span><span class="kc">null</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="kc">null</span><span class="p">},</span><span class="nx">l</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">l</span><span class="o">&lt;</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">.</span><span class="nx">length</span><span class="p">;</span><span class="nx">l</span><span class="o">++</span><span class="p">){</span><span class="kd">var</span> <span class="nx">e</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">[</span><span class="nx">l</span><span class="p">];</span><span class="k">switch</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">type</span><span class="p">){</span><span class="k">case</span> <span class="s2">&quot;moveTo&quot;</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot; m &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="p">));</span><span class="k">break</span><span class="p">;</span><span class="k">case</span> <span class="s2">&quot;lineTo&quot;</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot; l &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="p">));</span><span class="k">break</span><span class="p">;</span><span class="k">case</span> <span class="s2">&quot;close&quot;</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot; x &quot;</span><span class="p">);</span><span class="nx">e</span><span class="o">=</span><span class="kc">null</span><span class="p">;</span><span class="k">break</span><span class="p">;</span><span class="k">case</span> <span class="s2">&quot;bezierCurveTo&quot;</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot; c &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">cp1x</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">cp1y</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">cp2x</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">cp2y</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="p">));</span><span class="k">break</span><span class="p">;</span><span class="k">case</span> <span class="s2">&quot;at&quot;</span><span class="o">:</span><span class="k">case</span> <span class="s2">&quot;wa&quot;</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot; &quot;</span><span class="p">,</span><span class="nx">e</span><span class="p">.</span><span class="nx">type</span><span class="p">,</span><span class="s2">&quot; &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="o">-</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="o">*</span><span class="nx">e</span><span class="p">.</span><span class="nx">radius</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="o">-</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="o">*</span><span class="nx">e</span><span class="p">.</span><span class="nx">radius</span><span class="p">),</span></div><div class='line' id='LC29'><span class="s2">&quot; &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="o">+</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="o">*</span><span class="nx">e</span><span class="p">.</span><span class="nx">radius</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="o">+</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="o">*</span><span class="nx">e</span><span class="p">.</span><span class="nx">radius</span><span class="p">),</span><span class="s2">&quot; &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">xStart</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">yStart</span><span class="p">),</span><span class="s2">&quot; &quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">xEnd</span><span class="p">),</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">j</span><span class="p">(</span><span class="nx">e</span><span class="p">.</span><span class="nx">yEnd</span><span class="p">));</span><span class="k">break</span><span class="p">}</span><span class="k">if</span><span class="p">(</span><span class="nx">e</span><span class="p">){</span><span class="k">if</span><span class="p">(</span><span class="nx">h</span><span class="p">.</span><span class="nx">x</span><span class="o">==</span><span class="kc">null</span><span class="o">||</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="o">&lt;</span><span class="nx">h</span><span class="p">.</span><span class="nx">x</span><span class="p">)</span><span class="nx">h</span><span class="p">.</span><span class="nx">x</span><span class="o">=</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">g</span><span class="p">.</span><span class="nx">x</span><span class="o">==</span><span class="kc">null</span><span class="o">||</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="o">&gt;</span><span class="nx">g</span><span class="p">.</span><span class="nx">x</span><span class="p">)</span><span class="nx">g</span><span class="p">.</span><span class="nx">x</span><span class="o">=</span><span class="nx">e</span><span class="p">.</span><span class="nx">x</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">h</span><span class="p">.</span><span class="nx">y</span><span class="o">==</span><span class="kc">null</span><span class="o">||</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="o">&lt;</span><span class="nx">h</span><span class="p">.</span><span class="nx">y</span><span class="p">)</span><span class="nx">h</span><span class="p">.</span><span class="nx">y</span><span class="o">=</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">g</span><span class="p">.</span><span class="nx">y</span><span class="o">==</span><span class="kc">null</span><span class="o">||</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="o">&gt;</span><span class="nx">g</span><span class="p">.</span><span class="nx">y</span><span class="p">)</span><span class="nx">g</span><span class="p">.</span><span class="nx">y</span><span class="o">=</span><span class="nx">e</span><span class="p">.</span><span class="nx">y</span><span class="p">}}</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s1">&#39; &quot;&gt;&#39;</span><span class="p">);</span><span class="k">if</span><span class="p">(</span><span class="nx">b</span><span class="p">)</span><span class="k">if</span><span class="p">(</span><span class="k">typeof</span> <span class="k">this</span><span class="p">.</span><span class="nx">fillStyle</span><span class="o">==</span><span class="s2">&quot;object&quot;</span><span class="p">){</span><span class="kd">var</span> <span class="nx">m</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">fillStyle</span><span class="p">,</span><span class="nx">r</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span><span class="nx">n</span><span class="o">=</span><span class="p">{</span><span class="nx">x</span><span class="o">:</span><span class="mi">0</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="mi">0</span><span class="p">},</span><span class="nx">o</span><span class="o">=</span><span class="mi">0</span><span class="p">,</span><span class="nx">q</span><span class="o">=</span><span class="mi">1</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">m</span><span class="p">.</span><span class="nx">type_</span><span class="o">==</span><span class="s2">&quot;gradient&quot;</span><span class="p">){</span><span class="kd">var</span> <span class="nx">t</span><span class="o">=</span><span class="nx">m</span><span class="p">.</span><span class="nx">x1_</span><span class="o">/</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="p">,</span><span class="nx">E</span><span class="o">=</span><span class="nx">m</span><span class="p">.</span><span class="nx">y1_</span><span class="o">/</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="p">,</span><span class="nx">p</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">m</span><span class="p">.</span><span class="nx">x0_</span><span class="o">/</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="p">,</span><span class="nx">m</span><span class="p">.</span><span class="nx">y0_</span><span class="o">/</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="p">),</span></div><div class='line' id='LC30'><span class="nx">z</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">t</span><span class="p">,</span><span class="nx">E</span><span class="p">);</span><span class="nx">r</span><span class="o">=</span><span class="nb">Math</span><span class="p">.</span><span class="nx">atan2</span><span class="p">(</span><span class="nx">z</span><span class="p">.</span><span class="nx">x</span><span class="o">-</span><span class="nx">p</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">z</span><span class="p">.</span><span class="nx">y</span><span class="o">-</span><span class="nx">p</span><span class="p">.</span><span class="nx">y</span><span class="p">)</span><span class="o">*</span><span class="mi">180</span><span class="o">/</span><span class="nb">Math</span><span class="p">.</span><span class="nx">PI</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">r</span><span class="o">&lt;</span><span class="mi">0</span><span class="p">)</span><span class="nx">r</span><span class="o">+=</span><span class="mi">360</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">r</span><span class="o">&lt;</span><span class="mf">1.0</span><span class="nx">E</span><span class="o">-</span><span class="mi">6</span><span class="p">)</span><span class="nx">r</span><span class="o">=</span><span class="mi">0</span><span class="p">}</span><span class="k">else</span><span class="p">{</span><span class="kd">var</span> <span class="nx">p</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">getCoords_</span><span class="p">(</span><span class="nx">m</span><span class="p">.</span><span class="nx">x0_</span><span class="p">,</span><span class="nx">m</span><span class="p">.</span><span class="nx">y0_</span><span class="p">),</span><span class="nx">w</span><span class="o">=</span><span class="nx">g</span><span class="p">.</span><span class="nx">x</span><span class="o">-</span><span class="nx">h</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="nx">x</span><span class="o">=</span><span class="nx">g</span><span class="p">.</span><span class="nx">y</span><span class="o">-</span><span class="nx">h</span><span class="p">.</span><span class="nx">y</span><span class="p">;</span><span class="nx">n</span><span class="o">=</span><span class="p">{</span><span class="nx">x</span><span class="o">:</span><span class="p">(</span><span class="nx">p</span><span class="p">.</span><span class="nx">x</span><span class="o">-</span><span class="nx">h</span><span class="p">.</span><span class="nx">x</span><span class="p">)</span><span class="o">/</span><span class="nx">w</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="p">(</span><span class="nx">p</span><span class="p">.</span><span class="nx">y</span><span class="o">-</span><span class="nx">h</span><span class="p">.</span><span class="nx">y</span><span class="p">)</span><span class="o">/</span><span class="nx">x</span><span class="p">};</span><span class="nx">w</span><span class="o">/=</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="o">*</span><span class="nx">k</span><span class="p">;</span><span class="nx">x</span><span class="o">/=</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="o">*</span><span class="nx">k</span><span class="p">;</span><span class="kd">var</span> <span class="nx">R</span><span class="o">=</span><span class="nx">s</span><span class="p">.</span><span class="nx">max</span><span class="p">(</span><span class="nx">w</span><span class="p">,</span><span class="nx">x</span><span class="p">);</span><span class="nx">o</span><span class="o">=</span><span class="mi">2</span><span class="o">*</span><span class="nx">m</span><span class="p">.</span><span class="nx">r0_</span><span class="o">/</span><span class="nx">R</span><span class="p">;</span><span class="nx">q</span><span class="o">=</span><span class="mi">2</span><span class="o">*</span><span class="nx">m</span><span class="p">.</span><span class="nx">r1_</span><span class="o">/</span><span class="nx">R</span><span class="o">-</span><span class="nx">o</span><span class="p">}</span><span class="kd">var</span> <span class="nx">u</span><span class="o">=</span><span class="nx">m</span><span class="p">.</span><span class="nx">colors_</span><span class="p">;</span><span class="nx">u</span><span class="p">.</span><span class="nx">sort</span><span class="p">(</span><span class="kd">function</span><span class="p">(</span><span class="nx">ba</span><span class="p">,</span><span class="nx">ca</span><span class="p">){</span><span class="k">return</span> <span class="nx">ba</span><span class="p">.</span><span class="nx">offset</span><span class="o">-</span><span class="nx">ca</span><span class="p">.</span><span class="nx">offset</span><span class="p">});</span><span class="kd">var</span> <span class="nx">J</span><span class="o">=</span><span class="nx">u</span><span class="p">.</span><span class="nx">length</span><span class="p">,</span><span class="nx">da</span><span class="o">=</span><span class="nx">u</span><span class="p">[</span><span class="mi">0</span><span class="p">].</span><span class="nx">color</span><span class="p">,</span><span class="nx">ea</span><span class="o">=</span><span class="nx">u</span><span class="p">[</span><span class="nx">J</span><span class="o">-</span><span class="mi">1</span><span class="p">].</span><span class="nx">color</span><span class="p">,</span><span class="nx">fa</span><span class="o">=</span><span class="nx">u</span><span class="p">[</span><span class="mi">0</span><span class="p">].</span><span class="nx">alpha</span><span class="o">*</span><span class="k">this</span><span class="p">.</span><span class="nx">globalAlpha</span><span class="p">,</span><span class="nx">ga</span><span class="o">=</span><span class="nx">u</span><span class="p">[</span><span class="nx">J</span><span class="o">-</span><span class="mi">1</span><span class="p">].</span><span class="nx">alpha</span><span class="o">*</span><span class="k">this</span><span class="p">.</span><span class="nx">globalAlpha</span><span class="p">,</span><span class="nx">S</span><span class="o">=</span><span class="p">[],</span><span class="nx">l</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">l</span><span class="o">&lt;</span><span class="nx">J</span><span class="p">;</span><span class="nx">l</span><span class="o">++</span><span class="p">){</span><span class="kd">var</span> <span class="nx">T</span><span class="o">=</span><span class="nx">u</span><span class="p">[</span><span class="nx">l</span><span class="p">];</span><span class="nx">S</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="nx">T</span><span class="p">.</span><span class="nx">offset</span><span class="o">*</span><span class="nx">q</span><span class="o">+</span></div><div class='line' id='LC31'><span class="nx">o</span><span class="o">+</span><span class="s2">&quot; &quot;</span><span class="o">+</span><span class="nx">T</span><span class="p">.</span><span class="nx">color</span><span class="p">)}</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s1">&#39;&lt;g_vml_:fill type=&quot;&#39;</span><span class="p">,</span><span class="nx">m</span><span class="p">.</span><span class="nx">type_</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; method=&quot;none&quot; focus=&quot;100%&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; color=&quot;&#39;</span><span class="p">,</span><span class="nx">da</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; color2=&quot;&#39;</span><span class="p">,</span><span class="nx">ea</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; colors=&quot;&#39;</span><span class="p">,</span><span class="nx">S</span><span class="p">.</span><span class="nx">join</span><span class="p">(</span><span class="s2">&quot;,&quot;</span><span class="p">),</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; opacity=&quot;&#39;</span><span class="p">,</span><span class="nx">ga</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; g_o_:opacity2=&quot;&#39;</span><span class="p">,</span><span class="nx">fa</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; angle=&quot;&#39;</span><span class="p">,</span><span class="nx">r</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; focusposition=&quot;&#39;</span><span class="p">,</span><span class="nx">n</span><span class="p">.</span><span class="nx">x</span><span class="p">,</span><span class="s2">&quot;,&quot;</span><span class="p">,</span><span class="nx">n</span><span class="p">.</span><span class="nx">y</span><span class="p">,</span><span class="s1">&#39;&quot; /&gt;&#39;</span><span class="p">)}</span><span class="k">else</span> <span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s1">&#39;&lt;g_vml_:fill color=&quot;&#39;</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="s1">&#39;&quot; opacity=&quot;&#39;</span><span class="p">,</span><span class="nx">f</span><span class="p">,</span><span class="s1">&#39;&quot; /&gt;&#39;</span><span class="p">);</span><span class="k">else</span><span class="p">{</span><span class="kd">var</span> <span class="nx">K</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">lineScale_</span><span class="o">*</span><span class="k">this</span><span class="p">.</span><span class="nx">lineWidth</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">K</span><span class="o">&lt;</span><span class="mi">1</span><span class="p">)</span><span class="nx">f</span><span class="o">*=</span><span class="nx">K</span><span class="p">;</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot;&lt;g_vml_:stroke&quot;</span><span class="p">,</span><span class="s1">&#39; opacity=&quot;&#39;</span><span class="p">,</span><span class="nx">f</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; joinstyle=&quot;&#39;</span><span class="p">,</span><span class="k">this</span><span class="p">.</span><span class="nx">lineJoin</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; miterlimit=&quot;&#39;</span><span class="p">,</span><span class="k">this</span><span class="p">.</span><span class="nx">miterLimit</span><span class="p">,</span><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; endcap=&quot;&#39;</span><span class="p">,</span><span class="nx">aa</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">lineCap</span><span class="p">),</span></div><div class='line' id='LC32'><span class="s1">&#39;&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; weight=&quot;&#39;</span><span class="p">,</span><span class="nx">K</span><span class="p">,</span><span class="s1">&#39;px&quot;&#39;</span><span class="p">,</span><span class="s1">&#39; color=&quot;&#39;</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="s1">&#39;&quot; /&gt;&#39;</span><span class="p">)}</span><span class="nx">a</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="s2">&quot;&lt;/g_vml_:shape&gt;&quot;</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">element_</span><span class="p">.</span><span class="nx">insertAdjacentHTML</span><span class="p">(</span><span class="s2">&quot;beforeEnd&quot;</span><span class="p">,</span><span class="nx">a</span><span class="p">.</span><span class="nx">join</span><span class="p">(</span><span class="s2">&quot;&quot;</span><span class="p">))};</span><span class="nx">i</span><span class="p">.</span><span class="nx">fill</span><span class="o">=</span><span class="kd">function</span><span class="p">(){</span><span class="k">this</span><span class="p">.</span><span class="nx">stroke</span><span class="p">(</span><span class="kc">true</span><span class="p">)};</span><span class="nx">i</span><span class="p">.</span><span class="nx">closePath</span><span class="o">=</span><span class="kd">function</span><span class="p">(){</span><span class="k">this</span><span class="p">.</span><span class="nx">currentPath_</span><span class="p">.</span><span class="nx">push</span><span class="p">({</span><span class="nx">type</span><span class="o">:</span><span class="s2">&quot;close&quot;</span><span class="p">})};</span><span class="nx">i</span><span class="p">.</span><span class="nx">getCoords_</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="kd">var</span> <span class="nx">c</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">;</span><span class="k">return</span><span class="p">{</span><span class="nx">x</span><span class="o">:</span><span class="nx">k</span><span class="o">*</span><span class="p">(</span><span class="nx">b</span><span class="o">*</span><span class="nx">c</span><span class="p">[</span><span class="mi">0</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span><span class="o">+</span><span class="nx">a</span><span class="o">*</span><span class="nx">c</span><span class="p">[</span><span class="mi">1</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span><span class="o">+</span><span class="nx">c</span><span class="p">[</span><span class="mi">2</span><span class="p">][</span><span class="mi">0</span><span class="p">])</span><span class="o">-</span><span class="nx">v</span><span class="p">,</span><span class="nx">y</span><span class="o">:</span><span class="nx">k</span><span class="o">*</span><span class="p">(</span><span class="nx">b</span><span class="o">*</span><span class="nx">c</span><span class="p">[</span><span class="mi">0</span><span class="p">][</span><span class="mi">1</span><span class="p">]</span><span class="o">+</span><span class="nx">a</span><span class="o">*</span><span class="nx">c</span><span class="p">[</span><span class="mi">1</span><span class="p">][</span><span class="mi">1</span><span class="p">]</span><span class="o">+</span><span class="nx">c</span><span class="p">[</span><span class="mi">2</span><span class="p">][</span><span class="mi">1</span><span class="p">])</span><span class="o">-</span><span class="nx">v</span><span class="p">}};</span><span class="nx">i</span><span class="p">.</span><span class="nx">save</span><span class="o">=</span><span class="kd">function</span><span class="p">(){</span><span class="kd">var</span> <span class="nx">b</span><span class="o">=</span><span class="p">{};</span><span class="nx">O</span><span class="p">(</span><span class="k">this</span><span class="p">,</span><span class="nx">b</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">aStack_</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="nx">b</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">mStack_</span><span class="p">.</span><span class="nx">push</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="o">=</span><span class="nx">y</span><span class="p">(</span><span class="nx">I</span><span class="p">(),</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">)};</span><span class="nx">i</span><span class="p">.</span><span class="nx">restore</span><span class="o">=</span><span class="kd">function</span><span class="p">(){</span><span class="nx">O</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">aStack_</span><span class="p">.</span><span class="nx">pop</span><span class="p">(),</span></div><div class='line' id='LC33'><span class="k">this</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">mStack_</span><span class="p">.</span><span class="nx">pop</span><span class="p">()};</span><span class="kd">function</span> <span class="nx">ha</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">a</span><span class="o">&lt;</span><span class="mi">3</span><span class="p">;</span><span class="nx">a</span><span class="o">++</span><span class="p">){</span><span class="kd">var</span> <span class="nx">c</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">for</span><span class="p">(;</span><span class="nx">c</span><span class="o">&lt;</span><span class="mi">2</span><span class="p">;</span><span class="nx">c</span><span class="o">++</span><span class="p">)</span><span class="k">if</span><span class="p">(</span><span class="o">!</span><span class="nb">isFinite</span><span class="p">(</span><span class="nx">b</span><span class="p">[</span><span class="nx">a</span><span class="p">][</span><span class="nx">c</span><span class="p">])</span><span class="o">||</span><span class="nb">isNaN</span><span class="p">(</span><span class="nx">b</span><span class="p">[</span><span class="nx">a</span><span class="p">][</span><span class="nx">c</span><span class="p">]))</span><span class="k">return</span> <span class="kc">false</span><span class="p">}</span><span class="k">return</span> <span class="kc">true</span><span class="p">}</span><span class="kd">function</span> <span class="nx">A</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">){</span><span class="k">if</span><span class="p">(</span><span class="o">!!</span><span class="nx">ha</span><span class="p">(</span><span class="nx">a</span><span class="p">)){</span><span class="nx">b</span><span class="p">.</span><span class="nx">m_</span><span class="o">=</span><span class="nx">a</span><span class="p">;</span><span class="k">if</span><span class="p">(</span><span class="nx">c</span><span class="p">)</span><span class="nx">b</span><span class="p">.</span><span class="nx">lineScale_</span><span class="o">=</span><span class="nx">W</span><span class="p">(</span><span class="nx">V</span><span class="p">(</span><span class="nx">a</span><span class="p">[</span><span class="mi">0</span><span class="p">][</span><span class="mi">0</span><span class="p">]</span><span class="o">*</span><span class="nx">a</span><span class="p">[</span><span class="mi">1</span><span class="p">][</span><span class="mi">1</span><span class="p">]</span><span class="o">-</span><span class="nx">a</span><span class="p">[</span><span class="mi">0</span><span class="p">][</span><span class="mi">1</span><span class="p">]</span><span class="o">*</span><span class="nx">a</span><span class="p">[</span><span class="mi">1</span><span class="p">][</span><span class="mi">0</span><span class="p">]))}}</span><span class="nx">i</span><span class="p">.</span><span class="nx">translate</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="nx">A</span><span class="p">(</span><span class="k">this</span><span class="p">,</span><span class="nx">y</span><span class="p">([[</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="mi">1</span><span class="p">]],</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">),</span><span class="kc">false</span><span class="p">)};</span><span class="nx">i</span><span class="p">.</span><span class="nx">rotate</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="kd">var</span> <span class="nx">a</span><span class="o">=</span><span class="nx">G</span><span class="p">(</span><span class="nx">b</span><span class="p">),</span><span class="nx">c</span><span class="o">=</span><span class="nx">F</span><span class="p">(</span><span class="nx">b</span><span class="p">);</span><span class="nx">A</span><span class="p">(</span><span class="k">this</span><span class="p">,</span><span class="nx">y</span><span class="p">([[</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="o">-</span><span class="nx">c</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">]],</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">),</span><span class="kc">false</span><span class="p">)};</span><span class="nx">i</span><span class="p">.</span><span class="nx">scale</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleX_</span><span class="o">*=</span><span class="nx">b</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">arcScaleY_</span><span class="o">*=</span><span class="nx">a</span><span class="p">;</span><span class="nx">A</span><span class="p">(</span><span class="k">this</span><span class="p">,</span><span class="nx">y</span><span class="p">([[</span><span class="nx">b</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="mi">0</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span></div><div class='line' id='LC34'><span class="mi">0</span><span class="p">],[</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">]],</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">),</span><span class="kc">true</span><span class="p">)};</span><span class="nx">i</span><span class="p">.</span><span class="nx">transform</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">){</span><span class="nx">A</span><span class="p">(</span><span class="k">this</span><span class="p">,</span><span class="nx">y</span><span class="p">([[</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">,</span><span class="mi">1</span><span class="p">]],</span><span class="k">this</span><span class="p">.</span><span class="nx">m_</span><span class="p">),</span><span class="kc">true</span><span class="p">)};</span><span class="nx">i</span><span class="p">.</span><span class="nx">setTransform</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">){</span><span class="nx">A</span><span class="p">(</span><span class="k">this</span><span class="p">,[[</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="nx">c</span><span class="p">,</span><span class="nx">d</span><span class="p">,</span><span class="mi">0</span><span class="p">],[</span><span class="nx">f</span><span class="p">,</span><span class="nx">h</span><span class="p">,</span><span class="mi">1</span><span class="p">]],</span><span class="kc">true</span><span class="p">)};</span><span class="nx">i</span><span class="p">.</span><span class="nx">clip</span><span class="o">=</span><span class="kd">function</span><span class="p">(){};</span><span class="nx">i</span><span class="p">.</span><span class="nx">arcTo</span><span class="o">=</span><span class="kd">function</span><span class="p">(){};</span><span class="nx">i</span><span class="p">.</span><span class="nx">createPattern</span><span class="o">=</span><span class="kd">function</span><span class="p">(){</span><span class="k">return</span> <span class="k">new</span> <span class="nx">U</span><span class="p">};</span><span class="kd">function</span> <span class="nx">D</span><span class="p">(</span><span class="nx">b</span><span class="p">){</span><span class="k">this</span><span class="p">.</span><span class="nx">type_</span><span class="o">=</span><span class="nx">b</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">r1_</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">y1_</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">x1_</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">r0_</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">y0_</span><span class="o">=</span><span class="k">this</span><span class="p">.</span><span class="nx">x0_</span><span class="o">=</span><span class="mi">0</span><span class="p">;</span><span class="k">this</span><span class="p">.</span><span class="nx">colors_</span><span class="o">=</span><span class="p">[]}</span><span class="nx">D</span><span class="p">.</span><span class="nx">prototype</span><span class="p">.</span><span class="nx">addColorStop</span><span class="o">=</span><span class="kd">function</span><span class="p">(</span><span class="nx">b</span><span class="p">,</span><span class="nx">a</span><span class="p">){</span><span class="nx">a</span><span class="o">=</span><span class="nx">P</span><span class="p">(</span><span class="nx">a</span><span class="p">);</span><span class="k">this</span><span class="p">.</span><span class="nx">colors_</span><span class="p">.</span><span class="nx">push</span><span class="p">({</span><span class="nx">offset</span><span class="o">:</span><span class="nx">b</span><span class="p">,</span><span class="nx">color</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">color</span><span class="p">,</span><span class="nx">alpha</span><span class="o">:</span><span class="nx">a</span><span class="p">.</span><span class="nx">alpha</span><span class="p">})};</span><span class="kd">function</span> <span class="nx">U</span><span class="p">(){}</span><span class="nx">G_vmlCanvasManager</span><span class="o">=</span></div><div class='line' id='LC35'><span class="nx">M</span><span class="p">;</span><span class="nx">CanvasRenderingContext2D</span><span class="o">=</span><span class="nx">H</span><span class="p">;</span><span class="nx">CanvasGradient</span><span class="o">=</span><span class="nx">D</span><span class="p">;</span><span class="nx">CanvasPattern</span><span class="o">=</span><span class="nx">U</span><span class="p">})();</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

          </div>
        </div>
      </div>
    </div>

  </div>

<div class="frame frame-loading large-loading-area" style="display:none;" data-tree-list-url="/loudpixel/highcharts-rails/tree-list/dd4355a3587431608553e6cc347260fecf207239" data-blob-url-prefix="/loudpixel/highcharts-rails/blob/dd4355a3587431608553e6cc347260fecf207239">
  <img src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-64.gif?1334862346" height="64" width="64">
</div>

      </div>
      <div class="context-overlay"></div>
    </div>

      <div id="footer-push"></div><!-- hack for sticky footer -->
    </div><!-- end of wrapper - hack for sticky footer -->

      <!-- footer -->
      <div id="footer" >
        
  <div class="upper_footer">
     <div class="container clearfix">

       <!--[if IE]><h4 id="blacktocat_ie">GitHub Links</h4><![endif]-->
       <![if !IE]><h4 id="blacktocat">GitHub Links</h4><![endif]>

       <ul class="footer_nav">
         <h4>GitHub</h4>
         <li><a href="https://github.com/about">About</a></li>
         <li><a href="https://github.com/blog">Blog</a></li>
         <li><a href="https://github.com/features">Features</a></li>
         <li><a href="https://github.com/contact">Contact &amp; Support</a></li>
         <li><a href="https://github.com/training">Training</a></li>
         <li><a href="http://enterprise.github.com/">GitHub Enterprise</a></li>
         <li><a href="http://status.github.com/">Site Status</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Tools</h4>
         <li><a href="http://get.gaug.es/">Gauges: Analyze web traffic</a></li>
         <li><a href="http://speakerdeck.com">Speaker Deck: Presentations</a></li>
         <li><a href="https://gist.github.com">Gist: Code snippets</a></li>
         <li><a href="http://mac.github.com/">GitHub for Mac</a></li>
         <li><a href="http://windows.github.com/">GitHub for Windows</a></li>
         <li><a href="http://mobile.github.com/">Issues for iPhone</a></li>
         <li><a href="http://jobs.github.com/">Job Board</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Extras</h4>
         <li><a href="http://shop.github.com/">GitHub Shop</a></li>
         <li><a href="http://octodex.github.com/">The Octodex</a></li>
       </ul>

       <ul class="footer_nav">
         <h4>Documentation</h4>
         <li><a href="http://help.github.com/">GitHub Help</a></li>
         <li><a href="http://developer.github.com/">Developer API</a></li>
         <li><a href="http://github.github.com/github-flavored-markdown/">GitHub Flavored Markdown</a></li>
         <li><a href="http://pages.github.com/">GitHub Pages</a></li>
       </ul>

     </div><!-- /.site -->
  </div><!-- /.upper_footer -->

<div class="lower_footer">
  <div class="container clearfix">
    <!--[if IE]><div id="legal_ie"><![endif]-->
    <![if !IE]><div id="legal"><![endif]>
      <ul>
          <li><a href="https://github.com/site/terms">Terms of Service</a></li>
          <li><a href="https://github.com/site/privacy">Privacy</a></li>
          <li><a href="https://github.com/security">Security</a></li>
      </ul>

      <p>&copy; 2012 <span title="0.10141s from fe13.rs.github.com">GitHub</span> Inc. All rights reserved.</p>
    </div><!-- /#legal or /#legal_ie-->

      <div class="sponsor">
        <a href="http://www.rackspace.com" class="logo">
          <img alt="Dedicated Server" height="36" src="https://a248.e.akamai.net/assets.github.com/images/modules/footer/rackspaces_logo.png?1334862346" width="38" />
        </a>
        Powered by the <a href="http://www.rackspace.com ">Dedicated
        Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
        Computing</a> of Rackspace Hosting<span>&reg;</span>
      </div>
  </div><!-- /.site -->
</div><!-- /.lower_footer -->

      </div><!-- /#footer -->

    

<div id="keyboard_shortcuts_pane" class="instapaper_ignore readability-extra" style="display:none">
  <h2>Keyboard Shortcuts <small><a href="#" class="js-see-all-keyboard-shortcuts">(see all)</a></small></h2>

  <div class="columns threecols">
    <div class="column first">
      <h3>Site wide shortcuts</h3>
      <dl class="keyboard-mappings">
        <dt>s</dt>
        <dd>Focus site search</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>?</dt>
        <dd>Bring up this help dialog</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column middle" style='display:none'>
      <h3>Commit list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selection down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selection up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>c <em>or</em> o <em>or</em> enter</dt>
        <dd>Open commit</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>y</dt>
        <dd>Expand URL to its canonical form</dd>
      </dl>
    </div><!-- /.column.first -->

    <div class="column last" style='display:none'>
      <h3>Pull request list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selection down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selection up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
        <dd>Submit comment</dd>
      </dl>
    </div><!-- /.columns.last -->

  </div><!-- /.columns.equacols -->

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Issues</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>x</dt>
          <dd>Toggle selection</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
          <dd>Submit comment</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>c</dt>
          <dd>Create issue</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Create label</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>i</dt>
          <dd>Back to inbox</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>u</dt>
          <dd>Back to issues</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>/</dt>
          <dd>Focus issues search</dd>
        </dl>
      </div>
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Issues Dashboard</h3>

    <div class="columns threecols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt>j</dt>
          <dd>Move selection down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>k</dt>
          <dd>Move selection up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o <em>or</em> enter</dt>
          <dd>Open issue</dd>
        </dl>
      </div><!-- /.column.first -->
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>

    <h3>Network Graph</h3>
    <div class="columns equacols">
      <div class="column first">
        <dl class="keyboard-mappings">
          <dt><span class="badmono">←</span> <em>or</em> h</dt>
          <dd>Scroll left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">→</span> <em>or</em> l</dt>
          <dd>Scroll right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↑</span> <em>or</em> k</dt>
          <dd>Scroll up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt><span class="badmono">↓</span> <em>or</em> j</dt>
          <dd>Scroll down</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Toggle visibility of head labels</dd>
        </dl>
      </div><!-- /.column.first -->
      <div class="column last">
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">←</span> <em>or</em> shift h</dt>
          <dd>Scroll all the way left</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">→</span> <em>or</em> shift l</dt>
          <dd>Scroll all the way right</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↑</span> <em>or</em> shift k</dt>
          <dd>Scroll all the way up</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>shift <span class="badmono">↓</span> <em>or</em> shift j</dt>
          <dd>Scroll all the way down</dd>
        </dl>
      </div><!-- /.column.last -->
    </div>
  </div>

  <div >
    <div class="rule"></div>
    <div class="columns threecols">
      <div class="column first" >
        <h3>Source Code Browsing</h3>
        <dl class="keyboard-mappings">
          <dt>t</dt>
          <dd>Activates the file finder</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>l</dt>
          <dd>Jump to line</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>w</dt>
          <dd>Switch branch/tag</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>y</dt>
          <dd>Expand URL to its canonical form</dd>
        </dl>
      </div>
    </div>
  </div>

  <div style='display:none'>
    <div class="rule"></div>
    <div class="columns threecols">
      <div class="column first">
        <h3>Browsing Commits</h3>
        <dl class="keyboard-mappings">
          <dt><span class="platform-mac">⌘</span><span class="platform-other">ctrl</span> <em>+</em> enter</dt>
          <dd>Submit comment</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>escape</dt>
          <dd>Close form</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>p</dt>
          <dd>Parent commit</dd>
        </dl>
        <dl class="keyboard-mappings">
          <dt>o</dt>
          <dd>Other parent commit</dd>
        </dl>
      </div>
    </div>
  </div>
</div>

    <div id="markdown-help" class="instapaper_ignore readability-extra">
  <h2>Markdown Cheat Sheet</h2>

  <div class="cheatsheet-content">

  <div class="mod">
    <div class="col">
      <h3>Format Text</h3>
      <p>Headers</p>
      <pre>
# This is an &lt;h1&gt; tag
## This is an &lt;h2&gt; tag
###### This is an &lt;h6&gt; tag</pre>
     <p>Text styles</p>
     <pre>
*This text will be italic*
_This will also be italic_
**This text will be bold**
__This will also be bold__

*You **can** combine them*
</pre>
    </div>
    <div class="col">
      <h3>Lists</h3>
      <p>Unordered</p>
      <pre>
* Item 1
* Item 2
  * Item 2a
  * Item 2b</pre>
     <p>Ordered</p>
     <pre>
1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b</pre>
    </div>
    <div class="col">
      <h3>Miscellaneous</h3>
      <p>Images</p>
      <pre>
![GitHub Logo](/images/logo.png)
Format: ![Alt Text](url)
</pre>
     <p>Links</p>
     <pre>
http://github.com - automatic!
[GitHub](http://github.com)</pre>
<p>Blockquotes</p>
     <pre>
As Kanye West said:

> We're living the future so
> the present is our past.
</pre>
    </div>
  </div>
  <div class="rule"></div>

  <h3>Code Examples in Markdown</h3>
  <div class="col">
      <p>Syntax highlighting with <a href="http://github.github.com/github-flavored-markdown/" title="GitHub Flavored Markdown" target="_blank">GFM</a></p>
      <pre>
```javascript
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```</pre>
    </div>
    <div class="col">
      <p>Or, indent your code 4 spaces</p>
      <pre>
Here is a Python code example
without syntax highlighting:

    def foo:
      if not bar:
        return true</pre>
    </div>
    <div class="col">
      <p>Inline code for comments</p>
      <pre>
I think you should use an
`&lt;addr&gt;` element here instead.</pre>
    </div>
  </div>

  </div>
</div>


    <div id="ajax-error-message">
      <span class="mini-icon mini-icon-exclamation"></span>
      Something went wrong with that request. Please try again.
      <a href="#" class="ajax-error-dismiss">Dismiss</a>
    </div>

    <div id="logo-popup">
      <h2>Looking for the GitHub logo?</h2>
      <ul>
        <li>
          <h4>GitHub Logo</h4>
          <a href="http://github-media-downloads.s3.amazonaws.com/GitHub_Logos.zip"><img alt="Github_logo" src="https://a248.e.akamai.net/assets.github.com/images/modules/about_page/github_logo.png?1334862345" /></a>
          <a href="http://github-media-downloads.s3.amazonaws.com/GitHub_Logos.zip" class="minibutton btn-download download"><span class="icon"></span>Download</a>
        </li>
        <li>
          <h4>The Octocat</h4>
          <a href="http://github-media-downloads.s3.amazonaws.com/Octocats.zip"><img alt="Octocat" src="https://a248.e.akamai.net/assets.github.com/images/modules/about_page/octocat.png?1334862345" /></a>
          <a href="http://github-media-downloads.s3.amazonaws.com/Octocats.zip" class="minibutton btn-download download"><span class="icon"></span>Download</a>
        </li>
      </ul>
    </div>

    
    
    
    <span id='server_response_time' data-time='0.10379' data-host='fe13'></span>
  </body>
</html>

