{* Search container *}
{block name='frontend_index_search_container'}
    <form action="{url controller='search' fullPath=false}" method="get" id="searchform" class="navbar-form navbar-left" role="search">
        <div class="form-group">
            <input type="text" name="sSearch" id="searchfield" value="{s name="IndexSearchFieldValue"}Suche:{/s}" maxlength="30" class="form-control" placeholder="{s name="IndexSearchFieldValue"}Suche:{/s}">
        </div>
        <button type="submit" class="btn btn-default" id="submit_search">{s name="IndexSearchFieldValue"}Suche:{/s}</button>
    </form>
{/block}