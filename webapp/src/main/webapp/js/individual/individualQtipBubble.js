$(document).ready(function() {
    $.extend(this, i18nStrings);

    $('#researchAreaIcon').each(function() {
        $(this).qtip({
            prerender: true,
            content: {
                text: `<div class="tooltip-content">
                          <div>${i18nStrings.researchAreaTooltipOne}</div>
                          <div>${i18nStrings.researchAreaTooltipTwo}</div>
                       </div>`
            },
            position: {
                my: 'top left',
                at: 'bottom center',
                adjust: { x: 22, y: 30 }
            },
            style: {
                classes: 'researchAreaTip',
                height: 56,
                width: 180,
            }
        });
    });

    $('#fullViewIcon').each(function() {
        $(this).qtip({
            content: {
                text: `<div class="tooltip-content">
                          <div>${i18nStrings.quickviewTooltip}</div>
                       </div>`
            },
            position: {
                my: 'top left',
                at: 'bottom center',
                adjust: { x: 27, y: 30 }
            },
            style: {
                classes: 'bubbleTip',
                height: 56,
                width: 140,
            }
        });
    });

    $('#quickViewIcon').each(function() {
        $(this).qtip({
            content: {
                text: `<div class="tooltip-content">
                          <div>${i18nStrings.standardviewTooltipOne}</div>
                          <div>${i18nStrings.standardviewTooltipTwo}</div>
                       </div>`
            },
            position: {
                my: 'top left',
                at: 'bottom center',
                adjust: { x: 28, y: 30 }
            },
            style: {
                classes: 'bubbleTip',
                height: 56,
                width: 144,
            }
        });
    });
});
