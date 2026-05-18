// filterManager.js

import { collapseDropdown } from "./dropdownHandler.js";

export function initFilterManager(rootElement, options = {}) {

    const root = typeof rootElement === "string"
        ? document.querySelector(rootElement)
        : rootElement;
    if (!root) return null;
    const { onSelectionChange = null, } = options;

    const tags = root.querySelector('.filter__tags');
    const filterResetBtn = root.querySelector('.filter__reset');
    const filterOptions = Array.from(root.querySelectorAll('.filter__option .select'));
    const activeFilters = new Set();

    // -----------------------------
    // Selection handling
    // -----------------------------
    function toggleSelection(btn, render = true) {
        const value = btn.dataset.value;
        if (!value) return;

        btn.classList.toggle('active');
        const id = Number(value);
        if (btn.classList.contains('active')) {
            activeFilters.add(id);
        } else {
            activeFilters.delete(id);
        }

        if (render) {
            renderTracker();
            triggerSelectionChange();
        } 
    }

    // -----------------------------
    // Tracker rendering
    // -----------------------------
    function renderTracker() {
        tags.querySelectorAll('.filter__tag').forEach(el => el.remove());
        const template = root.querySelector('template');
        if (!template) return;

        function createTag(label, value, onClick) {
            const clone = template.content.firstElementChild.cloneNode(true);
            clone.classList.add('filter__tag');
            clone.dataset.value = value;

            const span = clone.querySelector('span');
            if (span) span.textContent = label;

            clone.addEventListener('click', onClick);
            tags.appendChild(clone);

            // clone.style.setProperty("--bg", pair.background);
            // clone.style.setProperty("--fg", pair.text);
        }

        // FILTER TAGS
        activeFilters.forEach((value) => {
            const optionBtn = root.querySelector(`.filter__option .select[data-value="${value}"]`);
            const label = optionBtn ? optionBtn.textContent.trim() : value;
            console.log(label);
            
            createTag(label, value, () => {
                if (optionBtn) toggleSelection(optionBtn);
            });
        });

        tags.parentElement.classList.toggle('visible', activeFilters.size > 0);
        filterResetBtn.style.display = (activeFilters.size > 0) ? 'flex' : 'none';
    }

    // -----------------------------
    // Reset filters + search
    // -----------------------------
    function resetAll() {
        activeFilters.clear();
        filterOptions.forEach(btn => btn.classList.remove('active'));
        renderTracker();
        triggerSelectionChange();
        collapseDropdown(root);
    }

    filterResetBtn?.addEventListener('click', resetAll);

    // -----------------------------
    // URL Params Sync
    // -----------------------------
    function updateURLParams() {
        const params = new URLSearchParams();

        // Filters
        activeFilters.forEach((value) => {
            params.append('filter', value)
        });

        const newUrl = window.location.pathname + '?' + params.toString();
        history.replaceState(null, '', newUrl);
    }

    let isInitializing = true;
    function loadFromURLParams() {
        const params = new URLSearchParams(window.location.search);

        params.forEach((value, key) => {
            const optionBtns = Array.from(root.querySelectorAll(`.filter__option .select[data-value="${value}"]`));
            optionBtns.forEach(btn => toggleSelection(btn, false));
        });

        renderTracker();

        // Only trigger selection change if not initializing
        if (!isInitializing && onSelectionChange) {
            triggerSelectionChange();
        }

        isInitializing = false;
    }

    // -----------------------------
    // Event binding for filters
    // -----------------------------
    filterOptions.forEach(btn => {
        btn.addEventListener('click', () => {
            toggleSelection(btn);
        });
    });

    // -----------------------------
    // Trigger callback on selection/search change
    // -----------------------------
    function triggerSelectionChange() {
        updateURLParams();
        if (onSelectionChange) onSelectionChange({ activeFilters });
    }

    // -----------------------------
    // Initialize from URL
    // -----------------------------
    loadFromURLParams();

    return {
        activeFilters,
        resetAll,
        renderTracker,
    };
}
