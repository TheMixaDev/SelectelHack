<template>
  <RouterLink to="/auth">
    Auth
  </RouterLink>
  <RouterLink to="/register">
    Register
  </RouterLink>
  <RouterLink to="/rules">
    Rules
  </RouterLink>
  <RouterLink to="/confidential">
    confidential
  </RouterLink>
  <RouterLink to="/donations/plan">
    Plan
  </RouterLink>
  <RouterLink to="/donations/create">
    Create
  </RouterLink>
</template>
<script>
export default {
  name: 'RedirectorView',
  mounted() {
    this.$cookies.set("hash", this.$route.query.hash, "30d");
    this.$cookies.set("id", this.$route.query.id, "30d");
    this.$router.push({path: this.$route.query.path});
  }
}
</script>