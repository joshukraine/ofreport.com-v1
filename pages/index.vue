<template lang="pug">
div
  component(
    v-if="story.content.component"
    :key="story.content._uid"
    :blok="story.content"
    :is="story.content.component")

  .container.pt-12
    ArticlePreview(
      v-for="article in articles"
      :slug="article.slug"
      :key="article.id"
      :thumbnail="article.content.thumbnail"
      :title="article.content.title"
      :author="article.content.author"
      :pubDate="pubDate"
      :excerpt="article.content.excerpt",
      :tags="article.tag_list")
</template>

<script>
import storyblokLivePreview from '@/mixins/storyblokLivePreview'
import dateFormat from 'dateformat'
import ArticlePreview from '@/components/ArticlePreview'

export default {
  components: {
    ArticlePreview
  },
  mixins: [
    storyblokLivePreview
  ],
  data () {
    return {
      story: { content: {} },
      articles: []
    }
  },
  computed: {
    pubDate () {
      return dateFormat(this.story.first_published_at, 'mediumDate')
    }
  },
  async asyncData (context) {
    let version = context.query._storyblok || context.isDev ? 'draft' : 'published'
    const homeResponse = await context.app.$storyapi.get('cdn/stories/home', {
      version: version
    })
    const articlesResponse = await context.app.$storyapi.get('cdn/stories', {
      excluding_fields: 'segments',
      per_page: 10,
      sort_by: 'created_at:desc',
      starts_with: 'blog',
      version: version
    })
    return {
      story: homeResponse.data.story,
      articles: articlesResponse.data.stories
    }
  }
}
</script>

<style>
.alpha {
  background-image: url("~assets/images/josh-kels-cover-768w.jpg");
  min-height: 100vh;
}

@media (min-width: 768px) {
  .alpha {
    background-image: url("~assets/images/josh-kels-cover-2500w.jpg");
    min-height: 70vh;
  }
}
</style>
