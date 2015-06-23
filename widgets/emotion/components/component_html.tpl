<div class="html-text-inner-element">
<div class="inner">
    {if $Data.cms_title}
        <h2 class="headline">{$Data.cms_title}</h2>
    {/if}

    <div class="text">  
        <pre class="hidden">
        $element.endCol = {$element.endCol}
        $element.startCol = {$element.startCol}
        </pre>
        <pre class="hidden">
        $colWidth = {$colWidth}
        $colHeight = {$colHeight}
        </pre>
        {$Data.text}
    </div>
</div>
</div>