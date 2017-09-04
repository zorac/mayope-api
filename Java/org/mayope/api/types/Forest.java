package org.mayope.api.types;

import java.util;

/**
 * Details of a forest.
 */
public class Forest {
    private UUID uuid;

    private String id;

    private String name;

    private String description;

    private List<Forest> forests;

    private List<Tree> trees;

    public UUID getUuid() {
        return uuid;
    }

    public void setUuid(UUID uuid) {
        this.uuid = uuid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Forest> getForests() {
        return forests;
    }

    public void setForests(List<Forest> forests) {
        this.forests = forests;
    }

    public List<Tree> getTrees() {
        return trees;
    }

    public void setTrees(List<Tree> trees) {
        this.trees = trees;
    }
}
