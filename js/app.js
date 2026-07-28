// ==========================================================================
// TRI-FOLD AI KNOWLEDGE BASE - APP CONTROLLER
// ==========================================================================

document.addEventListener('DOMContentLoaded', () => {
  const data = window.AI_DATA;
  if (!data) {
    console.error("AI_DATA not found!");
    return;
  }

  // --- STATE ---
  let activeView = 'providers';
  let activeFilter = 'all';
  let searchQuery = '';
  let selectedProvider = null;
  let activeModalTab = 'overview';

  // --- DOM ELEMENTS ---
  const viewNavTabs = document.getElementById('viewNavTabs');
  const providersView = document.getElementById('providersView');
  const servicesView = document.getElementById('servicesView');
  const comparisonsView = document.getElementById('comparisonsView');
  const calculatorView = document.getElementById('calculatorView');
  const architectureView = document.getElementById('architectureView');
  
  const searchInput = document.getElementById('searchInput');
  const filterTags = document.getElementById('filterTags');
  const toolsGrid = document.getElementById('toolsGrid');
  const servicesGrid = document.getElementById('servicesGrid');
  const matrixTableBody = document.getElementById('matrixTableBody');
  const archGrid = document.getElementById('archGrid');
  
  // Modal Elements
  const modalBackdrop = document.getElementById('modalBackdrop');
  const btnCloseModal = document.getElementById('btnCloseModal');
  const modalLogo = document.getElementById('modalLogo');
  const modalToolName = document.getElementById('modalToolName');
  const modalCategory = document.getElementById('modalCategory');
  const modalTabNav = document.getElementById('modalTabNav');
  const modalBodyContent = document.getElementById('modalBodyContent');

  // Calculator Elements
  const calcProvider = document.getElementById('calcProvider');
  const inputTokensM = document.getElementById('inputTokensM');
  const outputTokensM = document.getElementById('outputTokensM');
  const cachedRatio = document.getElementById('cachedRatio');
  const totalCostDisplay = document.getElementById('totalCostDisplay');
  const inputSubtotal = document.getElementById('inputSubtotal');
  const outputSubtotal = document.getElementById('outputSubtotal');
  const cacheSavings = document.getElementById('cacheSavings');

  // --- INIT ---
  renderProviders();
  renderServices();
  renderMatrix();
  renderArchitectures();
  calculateCosts();

  // --- VIEW SWITCHING ---
  viewNavTabs.addEventListener('click', (e) => {
    const btn = e.target.closest('.nav-btn');
    if (!btn) return;
    
    viewNavTabs.querySelectorAll('.nav-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    
    activeView = btn.dataset.view;
    
    providersView.style.display   = activeView === 'providers' ? 'block' : 'none';
    servicesView.style.display    = activeView === 'services' ? 'block' : 'none';
    comparisonsView.style.display = activeView === 'comparisons' ? 'block' : 'none';
    calculatorView.style.display  = activeView === 'calculator' ? 'block' : 'none';
    architectureView.style.display = activeView === 'architecture' ? 'block' : 'none';

    document.getElementById('controlsBar').style.display = (activeView === 'providers' || activeView === 'services') ? 'flex' : 'none';
  });

  // --- FILTERS & SEARCH ---
  searchInput.addEventListener('input', (e) => {
    searchQuery = e.target.value.toLowerCase().trim();
    renderProviders();
    renderServices();
  });

  filterTags.addEventListener('click', (e) => {
    const chip = e.target.closest('.filter-chip');
    if (!chip) return;
    filterTags.querySelectorAll('.filter-chip').forEach(c => c.classList.remove('active'));
    chip.classList.add('active');
    activeFilter = chip.dataset.filter;
    renderProviders();
  });

  // --- RENDER PROVIDERS (VIEW 1: BY PROVIDER) ---
  function renderProviders() {
    toolsGrid.innerHTML = '';

    const filtered = data.providers.filter(prov => {
      if (activeFilter === 'api' && !prov.hasApi) return false;

      if (searchQuery) {
        const text = `${prov.name} ${prov.tagline} ${prov.models.join(' ')} ${prov.apis.join(' ')}`.toLowerCase();
        if (!text.includes(searchQuery)) return false;
      }

      return true;
    });

    if (filtered.length === 0) {
      toolsGrid.innerHTML = `
        <div style="grid-column: 1/-1; text-align: center; padding: 4rem 1rem; color: var(--text-muted);">
          <h3 style="font-size: 1.5rem; margin-bottom: 0.5rem; color: #fff;">No providers found</h3>
          <p>Try clearing search keywords.</p>
        </div>
      `;
      return;
    }

    filtered.forEach(prov => {
      const card = document.createElement('div');
      card.className = 'tool-card';
      
      card.innerHTML = `
        <div>
          <div class="tool-header">
            <div class="tool-identity">
              <div class="tool-logo">${prov.logo}</div>
              <div>
                <div class="tool-name">${prov.name}</div>
                <div class="tool-category">Provider</div>
              </div>
            </div>
            <span class="badge-tag">${prov.badge}</span>
          </div>
          
          <p class="tool-tagline">${prov.tagline}</p>
          
          <div class="meta-spec-list">
            <div class="spec-item">
              <span class="spec-label">Flagship Model</span>
              <span class="spec-value" style="color: var(--primary-glow);">${prov.models[0]}</span>
            </div>
            <div class="spec-item">
              <span class="spec-label">Services Offered</span>
              <span class="spec-value" style="font-size: 0.78rem; color: var(--text-main);">${prov.servicesOffered.slice(0, 3).join(', ')}</span>
            </div>
            <div class="spec-item">
              <span class="spec-label">API Access</span>
              <span class="spec-value" style="color: var(--accent-green);">${prov.hasApi ? '✅ Available' : '❌ N/A'}</span>
            </div>
          </div>
        </div>
        
        <div class="card-actions">
          <button class="btn-inspect" data-id="${prov.id}">Inspect Provider Specs &rarr;</button>
        </div>
      `;

      card.querySelector('.btn-inspect').addEventListener('click', () => {
        openModal(prov);
      });

      toolsGrid.appendChild(card);
    });
  }

  // --- RENDER SERVICES (VIEW 2: BY SERVICE) ---
  function renderServices() {
    servicesGrid.innerHTML = '';
    data.services.forEach(serv => {
      const card = document.createElement('div');
      card.className = 'tool-card';
      card.style.background = 'var(--bg-card)';
      
      card.innerHTML = `
        <div>
          <span class="badge-tag" style="margin-bottom: 0.75rem; inline-block;">AI Service</span>
          <h3 style="color: #fff; font-size: 1.3rem; margin-bottom: 0.75rem;">${serv.name}</h3>
          <p style="color: var(--text-muted); font-size: 0.88rem; margin-bottom: 1rem;">Top providers offering **${serv.name}** capabilities:</p>
          
          <div style="display: flex; flex-wrap: wrap; gap: 0.5rem;">
            ${serv.providers.map(p => `<span class="filter-chip" style="font-size: 0.8rem; background: rgba(0,242,254,0.1); color: var(--primary-glow); border-color: var(--border-accent);">${p}</span>`).join('')}
          </div>
        </div>
      `;
      servicesGrid.appendChild(card);
    });
  }

  // --- MODAL INSPECTOR LOGIC ---
  function openModal(prov) {
    selectedProvider = prov;
    activeModalTab = 'overview';
    
    modalLogo.textContent = prov.logo;
    modalToolName.textContent = prov.name;
    modalCategory.textContent = `Provider Overview & Technical Breakdown`;
    
    modalTabNav.innerHTML = `
      <button class="modal-tab-btn active" data-tab="overview">1. Company & Models</button>
      <button class="modal-tab-btn" data-tab="apis">2. APIs & Endpoints</button>
      <button class="modal-tab-btn" data-tab="sdks">3. SDKs, Auth & Pricing</button>
      <button class="modal-tab-btn" data-tab="code">4. Code Example</button>
    `;

    renderModalBody();
    modalBackdrop.classList.add('active');
  }

  btnCloseModal.addEventListener('click', () => {
    modalBackdrop.classList.remove('active');
  });

  modalBackdrop.addEventListener('click', (e) => {
    if (e.target === modalBackdrop) modalBackdrop.classList.remove('active');
  });

  modalTabNav.addEventListener('click', (e) => {
    const btn = e.target.closest('.modal-tab-btn');
    if (!btn) return;
    modalTabNav.querySelectorAll('.modal-tab-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    activeModalTab = btn.dataset.tab;
    renderModalBody();
  });

  function renderModalBody() {
    if (!selectedProvider) return;
    const p = selectedProvider;
    const d = p.details;
    let html = '';

    if (activeModalTab === 'overview') {
      html = `
        <div class="section-grid">
          <div class="detail-box">
            <h3 class="box-title">🏢 Company Profile</h3>
            <p style="font-size: 0.95rem; color: var(--text-main); line-height: 1.6;">${d.company}</p>
          </div>

          <div class="detail-box">
            <h3 class="box-title">🧠 Models Catalog</h3>
            <ul style="padding-left: 1.2rem; font-size: 0.9rem; color: var(--text-main);">
              ${p.models.map(m => `<li style="margin-bottom: 0.4rem; color: var(--primary-glow);">${m}</li>`).join('')}
            </ul>
          </div>
        </div>
      `;
    } 
    else if (activeModalTab === 'apis') {
      html = `
        <div class="detail-box">
          <h3 class="box-title">⚡ Available APIs & Endpoints</h3>
          <ul style="padding-left: 1.2rem; font-size: 0.9rem; color: var(--text-main);">
            ${p.apis.map(a => `<li style="margin-bottom: 0.5rem; color: var(--accent-green); font-weight: 600;">${a}</li>`).join('')}
          </ul>
        </div>
      `;
    }
    else if (activeModalTab === 'sdks') {
      html = `
        <div class="section-grid">
          <div class="detail-box">
            <h3 class="box-title">⚙️ SDKs & Authentication</h3>
            <div class="kv-pair"><div class="kv-label">SDK Support</div><div class="kv-val">${d.sdks}</div></div>
            <div class="kv-pair" style="margin-top: 0.5rem;"><div class="kv-label">Auth Header</div><div class="kv-val"><code>${d.auth}</code></div></div>
          </div>

          <div class="detail-box">
            <h3 class="box-title">💳 Pricing & Rate Limits</h3>
            <div class="kv-pair"><div class="kv-label">Pricing Rates</div><div class="kv-val" style="font-family: var(--font-mono);">${d.pricing}</div></div>
            <div class="kv-pair" style="margin-top: 0.5rem;"><div class="kv-label">Rate Limits</div><div class="kv-val">${d.rateLimits}</div></div>
          </div>
        </div>
      `;
    }
    else if (activeModalTab === 'code') {
      html = `
        <div class="detail-box">
          <h3 class="box-title">💻 Runnable Code Example</h3>
          <div class="code-block">${escapeHtml(d.examples)}</div>
        </div>
      `;
    }

    modalBodyContent.innerHTML = html;
  }

  // --- RENDER MATRIX TABLE (VIEW 3: BY COMPARISON) ---
  function renderMatrix() {
    matrixTableBody.innerHTML = '';
    data.providers.forEach(prov => {
      const tr = document.createElement('tr');
      const d = prov.details;
      
      tr.innerHTML = `
        <td>
          <strong style="color: #fff;">${prov.logo} ${prov.name}</strong>
        </td>
        <td><span style="color: var(--primary-glow); font-weight: 600;">${prov.models[0]}</span></td>
        <td>${prov.hasApi ? '<span style="color: var(--accent-green);">Yes</span>' : '<span style="color: var(--text-dim);">No</span>'}</td>
        <td style="font-family: var(--font-mono); font-size: 0.85rem;">${d.pricing.split('|')[0]}</td>
        <td style="font-family: var(--font-mono); font-size: 0.85rem;">${d.pricing.split('|')[1] || 'N/A'}</td>
        <td style="color: var(--accent-green);">${prov.badge}</td>
        <td style="font-size: 0.85rem; color: var(--text-muted);">${prov.tagline}</td>
      `;
      matrixTableBody.appendChild(tr);
    });
  }

  // --- COST CALCULATOR LOGIC ---
  const rates = {
    gpt4o: { in: 2.50, out: 10.00 },
    o3mini: { in: 1.10, out: 4.40 },
    gpt4omini: { in: 0.15, out: 0.60 },
    claude37: { in: 3.00, out: 15.00 },
    claudehaiku: { in: 0.80, out: 4.00 },
    gemini25pro: { in: 1.25, out: 5.00 },
    geminiflash: { in: 0.075, out: 0.30 }
  };

  function calculateCosts() {
    const modelKey = calcProvider.value;
    const inM = parseFloat(inputTokensM.value) || 0;
    const outM = parseFloat(outputTokensM.value) || 0;
    const cachePct = parseFloat(cachedRatio.value) || 0;

    const rate = rates[modelKey] || rates.gpt4o;

    const rawInputCost = inM * rate.in;
    const cachedSavingsVal = rawInputCost * cachePct * 0.5;
    const effectiveInputCost = rawInputCost - cachedSavingsVal;
    
    const effectiveOutputCost = outM * rate.out;
    const total = effectiveInputCost + effectiveOutputCost;

    totalCostDisplay.textContent = `$${total.toFixed(2)}`;
    inputSubtotal.textContent = `$${rawInputCost.toFixed(2)}`;
    outputSubtotal.textContent = `$${effectiveOutputCost.toFixed(2)}`;
    cacheSavings.textContent = `-$${cachedSavingsVal.toFixed(2)}`;
  }

  [calcProvider, inputTokensM, outputTokensM, cachedRatio].forEach(el => {
    el.addEventListener('input', calculateCosts);
  });

  // --- RENDER ARCHITECTURES ---
  function renderArchitectures() {
    archGrid.innerHTML = '';
    data.architectures.forEach(arch => {
      const card = document.createElement('div');
      card.className = 'tool-card';
      card.style.background = 'var(--bg-card)';
      
      card.innerHTML = `
        <div>
          <span class="badge-tag" style="margin-bottom: 0.75rem; inline-block;">${arch.tag}</span>
          <h3 style="color: #fff; font-size: 1.3rem; margin-bottom: 0.5rem;">${arch.name}</h3>
          <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 1rem;">${arch.summary}</p>
          
          <h4 style="color: var(--primary-glow); font-size: 0.9rem; margin-bottom: 0.5rem;">Execution Flow:</h4>
          <ol style="padding-left: 1.2rem; font-size: 0.85rem; color: var(--text-main); margin-bottom: 1rem;">
            ${arch.steps.map(s => `<li style="margin-bottom: 0.3rem;">${s}</li>`).join('')}
          </ol>
          
          <h4 style="color: var(--accent-green); font-size: 0.9rem; margin-bottom: 0.2rem;">Code Pattern:</h4>
          <div class="code-block">${escapeHtml(arch.codeSnippet)}</div>
        </div>
      `;
      archGrid.appendChild(card);
    });
  }

  function escapeHtml(str) {
    return str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
  }
});
