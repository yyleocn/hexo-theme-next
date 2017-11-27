{% macro render(post, is_index, post_extra_class) %}
<article class="post post-type-{{ post.type | default('normal') }}" itemscope itemtype="http://schema.org/Article">
  <header class="post-header">

    <{% if theme.seo %}h3{% else %}h2{% endif %} class="post-title hide-title">
      {% if post.link %}{# Link posts #}
        <a class="post-title-link post-title-link-external" target="_blank" href="{{ url_for(post.link) }}"
           itemprop="url">
          {{ post.title or post.link }}
          <i class="fa fa-external-link"></i>
        </a>
      {% else %}
        <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">
          {% if post.type === 'picture' %}
            {{ post.content }}
          {% else %}
            <span itemprop="name">{{ post.title | default(__('post.untitled')) }}</span>
            {{ post.excerpt }}
            <!--noindex-->
            <div class="post-button text-center">
              <a class="btn color-white" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#{{ __('post.more') }}{% endif %}"
                 rel="contents">
                {{ __('post.read_more') }} &raquo;
              </a>
            </div>
          {% endif %}
        </a>
      {% endif %}
    </{% if theme.seo %}h3{% else %}h2{% endif %}>

    <div class="post-meta">
      <time class="post-time" itemprop="dateCreated"
            datetime="{{ moment(post.date).format() }}"
            content="{{ date(post.date, config.date_format) }}">
        {{ date(post.date, 'MM-DD') }}
      </time>
    </div>

  </header>
</article>

{% endmacro %}
